import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vitameal/domain/constants/analysis_policy.dart';

class AiAnalysisCard extends HookConsumerWidget {
  // AI 식단분석 결과 카드 위젯
  const AiAnalysisCard({
    super.key,
    required this.mealDayId,
    required this.needsAiRefresh,
    this.latestAiSummary,
    required this.todayCount,
    required this.isCountLoading,
    required this.hasEntries,
    required this.onAnalyze,
    required this.onOpenDetail,
    this.title = 'AI 분석 결과',
  });

  final String mealDayId;
  final bool needsAiRefresh; // 분석하기 버튼 활성화 여부
  final String? latestAiSummary; // 마지막 분석 (로컬의 meal_day)
  final int todayCount; // 오늘 사용한 분석 횟수
  final bool isCountLoading; // 오늘 사용한 분석횟수를 서버에서 가져오는중
  final bool hasEntries; // Entry가 있는지 여부. 없을때 버튼 예외처리용
  final Future<void> Function() onAnalyze; // 분석하기
  final Future<void> Function() onOpenDetail; // 자세히보기
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAnalyzing = useState(false); // 분석 트랜잭션 플래그

    /// 네트워크 체크
    Future<bool> isOnline() async {
      final connectivityResult = await Connectivity().checkConnectivity();
      return connectivityResult != ConnectivityResult.none;
    }

    /// AI 분석 요청
    Future<void> handleAnalyze() async {
      if (isAnalyzing.value) return;

      // 오프라인 체크
      final online = await isOnline();
      if (!online) {
        if (context.mounted) {
          // TODO : 지금 동작안하고 그냥 에러 메세지 출력됨
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('네트워크 연결을 확인해주세요'), duration: Duration(seconds: 2)));
        }
        return;
      }

      // 온라인일 경우만 분석 수행
      isAnalyzing.value = true;
      try {
        if (!context.mounted) return;
        await onAnalyze();
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('분석 실패: $e')));
        }
      } finally {
        isAnalyzing.value = false;
      }
    }

    /// 자세히 보기
    Future<void> handleOpenDetail() async {
      // 오프라인 환경에서 명시적 예외처리
      final online = await isOnline();
      if (!online) {
        if (context.mounted) {
          // TODO : 현재 동작 안함, 에러 메세지 그냥 출력됨
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('네트워크 연결 필요'),
              content: const Text('자세한 분석 결과를 보려면 인터넷 연결이 필요합니다.'),
              actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('확인'))],
            ),
          );
        }
        return;
      }

      if (!context.mounted) return;
      await onOpenDetail();
    }

    // 기존 요약 있는지 여부
    final hasSummary = (latestAiSummary ?? '').trim().isNotEmpty;
    // 분석 가능 여부
    final canAnalyze = !isCountLoading && todayCount < AnalysisPolicy.maxDailyAnalysisCount;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE9E9E9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(title: title),
          const SizedBox(height: 10),

          // 요약이 있으면 요약 보여주고 자세히 보기 제공
          if (hasSummary) ...[
            _ResultTextWithDetail(text: latestAiSummary!, onDetailTap: () => handleOpenDetail()),

            // 식단 변경으로 재분석이 필요하면 분석 버튼 활성화
            if (needsAiRefresh) ...[
              const SizedBox(height: 10),
              // 애니메이션으로 최대한 부드럽게 연결
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: hasEntries
                    ? _AnalyzeButton(
                        key: const ValueKey('analyze_button'),
                        // TODO : vm 쪽에서 label 결정하도록 리팩토링 하기
                        label: isAnalyzing.value || isCountLoading
                            ? '분석 중...'
                            : canAnalyze
                              ? '다시 분석하기 ($todayCount/${AnalysisPolicy.maxDailyAnalysisCount})'
                              : '오늘 분석 횟수를 모두 사용했어요 ($todayCount/${AnalysisPolicy.maxDailyAnalysisCount})',
                        enabled: !isAnalyzing.value && canAnalyze,
                        onTap: handleAnalyze,
                      )
                    : const SizedBox.shrink(key: ValueKey('empty')),
              ),
            ],
          ] else
            // 요약이 없을 때: 식단이 있으면 분석 버튼, 없으면 메세지 표시
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: hasEntries
                  ? _AnalyzeButton(
                      key: const ValueKey('analyze_button'),
                      label: isAnalyzing.value || isCountLoading
                          ? '분석 중...'
                          : canAnalyze
                            ? '분석하기 ($todayCount/${AnalysisPolicy.maxDailyAnalysisCount})'
                            : '오늘 분석 횟수를 모두 사용했어요 ($todayCount/${AnalysisPolicy.maxDailyAnalysisCount})',
                      enabled: !isAnalyzing.value && canAnalyze,
                      onTap: handleAnalyze,
                    )
                  : const Padding(
                      key: ValueKey('empty_message'),
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      // TODO : MealDay 없을때도 이거 나오도록 수정하기
                      child: Text('식단을 추가하면 AI 분석을 받을 수 있습니다', style: TextStyle(fontSize: 12.5, color: Colors.black54)),
                    ),
            ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  // 카드 헤더
  const _Header({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.auto_awesome, size: 16, color: Colors.black87),
        const SizedBox(width: 6),
        Text(
          title,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
      ],
    );
  }
}

class _AnalyzeButton extends StatelessWidget {
  /// 분석하기 버튼
  const _AnalyzeButton({super.key, required this.label, required this.onTap, required this.enabled});

  final String label;
  final VoidCallback onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: enabled ? const Color(0xFF7ED321) : Colors.grey.shade400,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w700,
            color: enabled ? Colors.black87 : Colors.white70,
          ),
        ),
      ),
    );
  }
}

class _ResultTextWithDetail extends StatelessWidget {
  /// 결과 텍스트 + 자세히 보기 버튼
  const _ResultTextWithDetail({super.key, required this.text, required this.onDetailTap});
  final String text;
  final VoidCallback onDetailTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12.5, height: 1.35, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onDetailTap,
          child: const Text(
            '자세히보기',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF7ED321),
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
