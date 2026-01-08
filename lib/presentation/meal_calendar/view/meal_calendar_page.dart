import 'dart:math' as math;
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vitameal/core/config/routes.dart';
import 'package:vitameal/core/di/provider.dart';
import 'package:vitameal/presentation/auth/view_model/auth_view_model.dart';
import 'package:vitameal/presentation/meal_calendar/view/widget/ai_analysis_card.dart';
import 'package:vitameal/presentation/meal_calendar/view/widget/ai_analysis_detail_dialog.dart';
import 'package:vitameal/presentation/meal_calendar/view/widget/calendar_header.dart';
import 'package:vitameal/presentation/meal_calendar/view/util/calendar_utils.dart';
import 'package:vitameal/presentation/meal_calendar/view/widget/adherence_picker.dart';
import 'package:vitameal/presentation/meal_calendar/view/widget/meal_card.dart';
import 'package:vitameal/presentation/meal_calendar/view/widget/meal_calendar.dart';
import 'package:vitameal/presentation/meal_calendar/view/util/adherence_color_utils.dart';
import 'package:vitameal/core/util/date_time_utils.dart';
import 'package:vitameal/presentation/meal_calendar/view_model/meal_analysis_viewmodel.dart';
import 'package:vitameal/presentation/meal_calendar/view_model/meal_calendar_viewmodel.dart';
import 'package:vitameal/presentation/ui_provider/meal_provider.dart';

class MealCalendarPage extends HookConsumerWidget {
  const MealCalendarPage({super.key});

  // 년.월 라벨 + 요일 고정 영역 (40 + 40)
  static const double _headerHeight = 80;
  // Week 모드 높이 (화면 내렸을 때 표시되는 주 캘린더)
  static const double _weekCalendarHeight = 44;
  // Month 모드 행 개수 = 6주
  static const int _rowCount = 6;
  // 헤더 제외 공간 중 월 캘린더가 차지할 비율 (1.0 = 꽉차게)
  static const double _monthCalendarRatio = 1.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 인증 정보
    final session = ref.watch(authViewModelProvider);
    final userId = session?.user.id;

    // userId가 없으면 로딩 표시
    if (userId == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // UI 상태 값들
    final contentScrollController = useScrollController();
    final focusedDay = useState(DateTime.now()); // 현재 캘린더 페이지의 렌더링 기준이 되는 날
    final selectedDay = useState(DateTime.now().dateOnly); // 선택된 날짜
    final lastTappedDay = useState<DateTime?>(null); // 마지막으로 선택된 날짜
    final dragStartY = useState<double?>(null); // 세로 드래그
    final dragEndY = useState<double?>(null); // 세로 드래그

    // 애니메이션 컨트롤러
    final collapseCtrl = useAnimationController(duration: const Duration(milliseconds: 360));

    // 월의 시작/끝 날짜 계산 (focusedDay 기준)
    final startOfMonth = DateTime(focusedDay.value.year, focusedDay.value.month, 1);
    final endOfMonth = DateTime(focusedDay.value.year, focusedDay.value.month + 1, 0);

    // MealCalendarViewModel - 캘린더 색상 바용
    final calendarViewModel = ref.watch(
      mealCalendarViewModelProvider(userId, startOfMonth, endOfMonth),
    );

    // 캘린더 색상 맵 생성
    final colorOfDay = calendarViewModel.maybeWhen(
      data: (mealDays) => AdherenceColorUtils.buildColorMap(mealDays),
      orElse: () => <DateTime, Color>{},
    );

    // 선택된 날짜의 MealDay 찾기
    final selectedMealDay = calendarViewModel.maybeWhen(
      data: (mealDays) => mealDays.firstWhereOrNull(
        (day) => CalendarUtils.isSameDay(day.mealDate, selectedDay.value),
      ),
      orElse: () => null,
    );

    // 선택된 날짜의 식단 항목 조회
    final mealEntriesAsync = selectedMealDay != null
        ? ref.watch(mealEntriesProvider(selectedMealDay.id))
        : null;

    // 오늘 사용한 분석 횟수 조회
    final todayCountAsync = ref.watch(todayAnalysisCountProvider(userId));

    // AI 분석 카드에 전달할 값들, 설명은 ai_analysis_card 변수에,,
    final todayCount = todayCountAsync.maybeWhen(data: (count) => count, orElse: () => 0);
    final isCountLoading = todayCountAsync.isLoading;
    final hasEntries = mealEntriesAsync?.maybeWhen(data: (entries) => entries.isNotEmpty, orElse: () => false) ?? false;

    /// 날짜 탭 인터렉션
    void onDayTapped(DateTime day) {
      final tapped = day.dateOnly;

      // 1회 탭했을 경우 선택만
      if (!CalendarUtils.isSameDay(tapped, selectedDay.value)) {
        selectedDay.value = tapped;
        focusedDay.value = tapped;
        lastTappedDay.value = tapped;

        // 애니메이션 중간에 다른 날짜 선택 시 Month 모드로 복귀
        if (collapseCtrl.value > 0 && collapseCtrl.value < 0.9) {
          collapseCtrl.animateTo(0.0, curve: Curves.easeOutCubic);
        }
        return;
      }

      // 선택된 상태에서 같은 날짜를 한 번 더 탭했을 경우 모드 전환
      final last = lastTappedDay.value;
      lastTappedDay.value = tapped;

      if (last != null && CalendarUtils.isSameDay(last, tapped)) {
        // Week 모드면 Month 모드로, Month 모드면 Week 모드로 전환
        if (collapseCtrl.value >= 0.9) {
          collapseCtrl.animateTo(0.0, curve: Curves.easeOutCubic);
        } else {
          collapseCtrl.animateTo(1.0, curve: Curves.easeOutCubic);
        }
      }
    }

    /// 페이지 변경 콜백. 좌우 스크롤 시 호출
    void onPageChanged(DateTime newFocused) {
      focusedDay.value = newFocused;
      // Week 모드에서만 selectedDay 업데이트 (Month 모드에서는 년.월만 업데이트)
      if (collapseCtrl.value >= 0.9) {
        selectedDay.value = newFocused.dateOnly;
        lastTappedDay.value = selectedDay.value;
      }
    }

    // 성취도 평가 업데이트
    Future<void> setColorBar(Color color) async {
      final adherence = AdherenceColorUtils.colorToAdherence(color);

      try {
        String mealDayId;

        // MealDay가 없으면 먼저 생성 (식단 추가와 동일한 로직)
        if (selectedMealDay == null) {
          final mealDay = await ref.read(mealRepositoryProvider).getOrCreateMealDay(
            userId: userId,
            date: selectedDay.value,
          );
          mealDayId = mealDay.id;
        } else {
          mealDayId = selectedMealDay.id;
        }

        // Adherence 업데이트 (UI 즉시 반영)
        await ref.read(mealCalendarViewModelProvider(userId, startOfMonth, endOfMonth).notifier)
          .updateAdherence(
            mealDayId: mealDayId,
            adherence: adherence,
          );
      } catch (e) {
        // 에러 처리 (필요 시 SnackBar 등으로 사용자에게 알림)
        debugPrint('성취도 업데이트 실패: $e');
      }
    }

    // AI 분석
    Future<void> handleAnalyze() async {
      if (selectedMealDay == null) return;

      // 분석 수행 후 결과 받기
      final viewModel = ref.read(mealAnalysisViewModelProvider.notifier);
      final analysisResult = await viewModel.requestAnalysis(selectedMealDay.id);

      // 로컬 DB 업데이트 (summary + needs_ai_refresh=false)
      // TODO : data_source로 옮기기
      final database = ref.read(appDatabaseProvider);
      await database.mealDao.updateMealDayAfterAnalysis(
        mealDayId: selectedMealDay.id,
        summary: analysisResult.overallSummary,
      );

      // Provider 갱신
      ref.invalidate(mealCalendarViewModelProvider); // 버튼 활성화 여부
      ref.read(todayAnalysisCountProvider(userId).notifier).refresh(); // 사용한 분석 횟수
    }

    // 자세히 보기: 기저질환에 관한 피드백이 들어있는 대화상자 출력
    Future<void> handleOpenDetail() async {
      if (selectedMealDay == null) return;

      // 분석 결과 받아오기 (원격 db)
      final notifier = ref.read(mealAnalysisViewModelProvider.notifier);
      final analysis = await notifier.getLatestAnalysis(selectedMealDay.id);

      if (analysis == null) {
        throw Exception('분석 결과가 없습니다.');
      }

      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AiAnalysisDetailDialog(analysis: analysis),
        );
      }
    }

    // 애니메이션 진행도 (0.0: Month 모드, 1.0: Week 모드)
    final t = useAnimation(collapseCtrl); // collapseCtrl.value 상태 구독

    // Week 모드 여부
    final isWeekMode = t >= 0.9;

    return Scaffold(
      body: SafeArea(
        top: true,
        // LayoutBuilder로 위젯 높이 기반 행높이 계산
        child: LayoutBuilder(
          builder: (context, constraints) {
            final availableHeight = constraints.maxHeight;

            // 월 캘린더 높이 (헤더 제외 영역)
            final monthCalendarHeight = (availableHeight - _headerHeight) * _monthCalendarRatio;
            // 행 높이 계산
            final rowHeightMonth = monthCalendarHeight / _rowCount;

            // 선택된 날짜가 속한 주
            final weekIndex = CalendarUtils.weekIndexInMonthGrid(
              focusedDay.value,
              selectedDay.value,
              rowCount: _rowCount,
            );
            // 행 높이를 애니메이션 진행에 따라 보간 (Month 모드 - Week 모드)
            final rowHeight = lerpDouble(rowHeightMonth, _weekCalendarHeight, t)!;
            // 애니메이션 진행에 따라 선택된 날짜가 속한 주를 맨 위로 올리기 위한 이동량
            final translateY = isWeekMode ? 0.0 : -weekIndex * rowHeight * t;

            // DayCell의 여백 높이 계산 (41 = DayCell의 날짜 부분 높이)
            final barAreaHeightMonth = math.max(0.0, rowHeightMonth - 41);
            // 애니메이션에 따라 없어질 때 보간
            final barArea = lerpDouble(barAreaHeightMonth, 0.0, t)!;

            // 애니메이션에 따른 TableCalendar 높이 계산
            final calendarHeight = lerpDouble(monthCalendarHeight, _weekCalendarHeight, t)!;

            return Column(
              children: [
                // 상단 고정 영역 (년.월 + 월화수목금토일)
                SizedBox(
                  height: _headerHeight,
                  child: CalendarHeader(focused: focusedDay.value),
                ),

                SizedBox(
                  // ClipRect와 calendarHeight를 통해 실제 보이는 부분 제어
                  height: calendarHeight,
                  child: ClipRect(
                    child: Stack(
                      children: [
                        // 스크롤 진행도에 따라 위로 translate 해서 선택 주가 맨 위에 오게
                        Transform.translate(
                          offset: Offset(0, translateY),
                          child: OverflowBox(
                            minHeight: monthCalendarHeight, // 오버플로우 방지, 항상 월 캘린더 높이로
                            maxHeight: monthCalendarHeight, // 오버플로우 방지, 항상 월 캘린더 높이로
                            alignment: Alignment.topCenter,
                            child: MonthCalendar(
                              focusedDay: focusedDay.value,
                              selectedDay: selectedDay.value,
                              rowHeight: rowHeight,
                              barAreaHeight: barArea,
                              barColorByDay: colorOfDay,
                              onDayTap: onDayTapped,
                              calendarFormat: isWeekMode ? CalendarFormat.week : CalendarFormat.month,
                              onPageChanged: onPageChanged,
                            ),
                          ),
                        ),

                        // 수직 드래그 감지
                        Positioned.fill(
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            // 드래그 시작 위치 저장
                            onVerticalDragStart: (details) {
                              dragStartY.value = details.globalPosition.dy;
                              dragEndY.value = details.globalPosition.dy;
                            },
                            // 드래그 중 현재 위치 업데이트
                            onVerticalDragUpdate: (details) {
                              dragEndY.value = details.globalPosition.dy;
                            },
                            onVerticalDragEnd: (details) {
                              if (dragStartY.value == null || dragEndY.value == null) return;
                              // 드래그 방향 체크
                              final dragDistance = dragEndY.value! - dragStartY.value!;
                              dragStartY.value = null;
                              dragEndY.value = null;
                              // 최소 50px 드래그
                              if (dragDistance.abs() < 50) return;
                              // 위로 드래그 (Month -> Week)
                              if (dragDistance < 0) {
                                if (!isWeekMode) {
                                  collapseCtrl.animateTo(1.0, curve: Curves.easeOutCubic);
                                }
                              }
                              // 아래로 드래그 (Week -> Month)
                              else {
                                if (isWeekMode) {
                                  collapseCtrl.animateTo(0.0, curve: Curves.easeOutCubic);
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 식단 내용 영역
                Expanded(
                  child: SingleChildScrollView(
                    controller: contentScrollController,
                    child: Column(
                      children: [
                        // 성취도 평가 위젯
                        AdherencePicker(
                          selectedDay: selectedDay.value,
                          adherence: colorOfDay[selectedDay.value],
                          onPick: setColorBar,
                        ),
                        // 분석 카드
                        if (selectedMealDay != null)
                          AiAnalysisCard(
                            mealDayId: selectedMealDay.id,
                            needsAiRefresh: selectedMealDay.needsAiRefresh,
                            latestAiSummary: selectedMealDay.latestAiSummary,
                            todayCount: todayCount,
                            isCountLoading: isCountLoading,
                            hasEntries: hasEntries,
                            onAnalyze: handleAnalyze,
                            onOpenDetail: handleOpenDetail,
                          ),
                        // 식단 카드 리스트
                        if (mealEntriesAsync != null)
                          mealEntriesAsync.when(
                            data: (entries) {
                              if (entries.isEmpty) {
                                return const Padding(
                                  padding: EdgeInsets.all(32.0),
                                  child: Center(
                                    child: Text(
                                      '식단 기록이 없습니다',
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                );
                              }

                              // 시간순 정렬
                              final sortedEntries = entries.toList()
                                ..sort((a, b) {
                                  final aTime = a.eatenAt ?? DateTime(2000);
                                  final bTime = b.eatenAt ?? DateTime(2000);
                                  return aTime.compareTo(bTime);
                                });

                              return Column(
                                children: sortedEntries
                                    .map(
                                      (entry) => MealCard(
                                        entryId: entry.id,
                                        category: entry.category,
                                        content: entry.content,
                                        photoUrl: entry.photoUrl,
                                        eatenAt: entry.eatenAt,
                                        onTap: () async {
                                          // MealEditor로 이동 (수정 모드)
                                          await context.push(
                                            AppRoutePath.mealEditor,
                                            extra: {
                                              'mealEntryId': entry.id,
                                              'mealDayId': selectedMealDay!.id,
                                              'date': selectedDay.value,
                                            },
                                          );
                                          // Provider로 따로 뺀거라 돌아온 후 갱신 해줘야함
                                          // TODO: vm에서 state 클래스로 같이 관리하도록 리팩토링 하기
                                          ref.invalidate(mealEntriesProvider(selectedMealDay.id));
                                        },
                                      ),
                                    )
                                    .toList(),
                              );
                            },
                            loading: () => const Padding(
                              padding: EdgeInsets.all(32.0),
                              child: Center(child: CircularProgressIndicator()),
                            ),
                            error: (error, stack) => Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Center(
                                child: Text(
                                  '에러 발생: $error',
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                          )
                        else
                          const Padding(
                            padding: EdgeInsets.all(32.0),
                            child: Center(
                              child: Text(
                                '날짜를 선택해주세요',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.push(
            AppRoutePath.mealEditor,
            extra: {
              'mealDayId': selectedMealDay?.id,
              'date': selectedDay.value,
            },
          );
          // Provider로 따로 뺀거라 돌아온 후 갱신 해줘야함
          // TODO: vm에서 state 클래스로 같이 관리하도록 리팩토링 하기
          if (selectedMealDay != null) {
            ref.invalidate(mealEntriesProvider(selectedMealDay.id));
          }
        },
        elevation: 0,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}
