import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vitameal/core/theme/app_theme.dart';
import 'package:vitameal/presentation/notification/view/widget/add_noti_bottom_sheet.dart';
import 'package:vitameal/presentation/ui_provider/notifications_provider.dart';
import 'package:vitameal/presentation/notification/view_model/notifications_view_model.dart';
import 'package:vitameal/presentation/widget/button/add_button.dart';
import 'package:vitameal/presentation/widget/dialog/delete_dialog.dart';

class NotificationPage extends HookConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notisAsync = ref.watch(getAllNotisProvider);

    // 알림명 : 사용자 입력값 받기
    final labelController = useTextEditingController();

    // next_fire_at 계산
    DateTime calculateNextFireAt({required TimeOfDay time}) {
      final now = DateTime.now();

      DateTime scheduled = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );

      // 이미 지났으면 다음 날
      if (scheduled.isBefore(now)) {
        scheduled = scheduled.add(const Duration(days: 1));
      }

      // DB에는 무조건 UTC
      return scheduled.toUtc();
    }

    return Scaffold(
      appBar: AppBar(title: Text("알림 설정")),
      body: notisAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('에러 발생: $e')),
        data: (notis) {
          final list = notis ?? [];
          return Padding(
            padding: EdgeInsets.all(20),

            /// 알림 리스트
            child: ListView.builder(
              itemCount: list.length + 1,
              itemBuilder: (context, index) {
                if (index == list.length) {
                  return Column(
                    spacing: 30,
                    children: [
                      // 알림 없을 때 화면
                      list.isEmpty
                          ? Image.asset(
                              "assets/images/no_alarm.webp",
                              height: 300,
                              width: 300,
                            )
                          : SizedBox.shrink(),

                      /// 새 알림 추가 버튼
                      AddButton(
                        onTap: () async {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            builder: (context) {
                              return AddNotiBottomSheet(
                                noti: null,
                                controller: labelController,
                                initialTime: TimeOfDay.now(),
                                onConfirm: (newTime) async {
                                  // 알림 추가
                                  await ref
                                      .read(
                                        notificationsViewModelProvider.notifier,
                                      )
                                      .saveNoti(
                                        label: labelController.text,
                                        time: newTime,
                                        isEnabled: true,
                                        timezone: "Asia/Seoul",
                                        nextFireAt: calculateNextFireAt(
                                          time: newTime,
                                        ),
                                      );
                                  // mounted 체크
                                  if (!context.mounted) return;
                                  // UI 반영
                                  ref.invalidate(getAllNotisProvider);
                                },
                              );
                            },
                          );
                        },
                        borderColor: fxc(context).primary400!,
                        text: "+ 새 알림 추가하기",
                        textColor: fxc(context).primary400!,
                      ),
                    ],
                  );
                }
                final noti = list[index];

                /// 스와이프
                return Slidable(
                  key: ValueKey(noti.notiId),
                  endActionPane: ActionPane(
                    motion: DrawerMotion(),
                    extentRatio: 0.25,
                    children: [
                      SlidableAction(
                        onPressed: (_) async {
                          final ok = await showDialog<bool>(
                            context: context,
                            builder: (_) => DeleteDialog(
                              onDelete: () => Navigator.pop(context, true),
                            ),
                          );
                          if (ok != true) return;
                          // 알림 삭제
                          await ref
                              .read(notificationsViewModelProvider.notifier)
                              .deleteNoti(noti.notiId!);
                          // mounted 체크
                          if (!context.mounted) return;
                          // UI 반영
                          ref.invalidate(getAllNotisProvider);
                        },
                        backgroundColor: fxc(context).secondary400!,
                        icon: Icons.close,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () async {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        builder: (context) {
                          return AddNotiBottomSheet(
                            noti: noti,
                            controller: labelController,
                            initialTime: noti.time,
                            onConfirm: (newTime) async {
                              // 알림 업데이트
                              await ref
                                  .read(notificationsViewModelProvider.notifier)
                                  .updateNoti(
                                    notiId: noti.notiId!,
                                    label: labelController.text,
                                    time: newTime,
                                    isEnabled: noti.isEnabled,
                                    timezone: noti.timezone,
                                    nextFireAt: calculateNextFireAt(
                                      time: newTime,
                                    ),
                                  );
                              // mounted 체크
                              if (!context.mounted) return;
                              // UI 반영
                              ref.invalidate(getAllNotisProvider);
                            },
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey)),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        spacing: 10,
                        children: [
                          /// 알림명
                          Expanded(
                            child: Text(
                              noti.label,
                              style: TextStyle(fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          /// 알림 시간
                          Text(
                            noti.time.format(context),
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.right,
                          ),

                          /// on/off 토글
                          Switch.adaptive(
                            applyCupertinoTheme: true,
                            value: noti.isEnabled,
                            activeThumbColor: Colors.white,
                            activeTrackColor: fxc(context).accentsgreen,
                            onChanged: (value) async {
                              // 알림 업데이트
                              await ref
                                  .read(notificationsViewModelProvider.notifier)
                                  .updateNoti(
                                    notiId: noti.notiId!,
                                    label: noti.label,
                                    time: noti.time,
                                    isEnabled: value,
                                    timezone: noti.timezone,
                                    nextFireAt: noti.nextFireAt,
                                  );
                              // mounted 체크
                              if (!context.mounted) return;
                              // UI 반영
                              ref.invalidate(getAllNotisProvider);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
