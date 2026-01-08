import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tap_debouncer/tap_debouncer.dart';
import 'package:vitameal/core/theme/app_theme.dart';
import 'package:vitameal/presentation/onboarding/view/widget/select_box.dart';
import 'package:vitameal/presentation/ui_provider/profiles_provider.dart';
import 'package:vitameal/presentation/onboarding/viewmodel/onboarding_view_model.dart';
import 'package:vitameal/presentation/widget/button/done_button.dart';

class OnboardingAllergyPage extends HookConsumerWidget {
  const OnboardingAllergyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 알레르기 목록
    final allergiesAsync = ref.watch(allergiesListProvider);

    // 사용자 선택값
    final selectedAllergies = useState<List<String>>([]);

    // 수정모드 여부
    final isEditing = ref.watch(isEditFlowProvider);

    // 수정모드 시 기존값 불러오기
    final selectedAsync = ref.watch(userSelectedAllergiesProvider);
    final didInit = useRef(false);
    useEffect(() {
      if (!isEditing) return null;
      if (didInit.value) return null;
      final values = selectedAsync.value;
      if (values == null) return null;
      didInit.value = true;
      selectedAllergies.value = values;
      return null;
    }, [isEditing, selectedAsync]);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              /// 단계 표시
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 16, color: vrc(context).text),
                    children: [
                      TextSpan(
                        text: '4',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: fxc(context).primary400,
                        ),
                      ),
                      TextSpan(text: ' / 4'),
                    ],
                  ),
                ),
              ),

              /// 설명
              isEditing
                  ? Text(
                      "내 정보 수정",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: vrc(context).text,
                      ),
                    )
                  : Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 22,
                          color: vrc(context).text,
                        ),
                        children: [
                          TextSpan(text: "현재 겪고 있는 "),
                          TextSpan(
                            text: "알레르기",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: "를\n모두 선택해주세요. (선택)"),
                        ],
                      ),
                    ),
              SizedBox(height: 10),

              /// 알레르기 선택
              Expanded(
                child: allergiesAsync.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) =>
                      const Center(child: Text('알레르기 목록을 불러오지 못했어요')),
                  data: (allergies) {
                    return GridView.builder(
                      itemCount: allergies.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 3 / 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        final allergy = allergies[index];
                        final isSelected = selectedAllergies.value.contains(
                          allergy.name,
                        );
                        return SelectBox(
                          onTap: () {
                            final current = [...selectedAllergies.value];
                            if (isSelected) {
                              current.remove(allergy.name); // 선택된 것 누르면 제거
                            } else {
                              current.add(allergy.name); // 선택안된 것 누르면 추가
                            }
                            selectedAllergies.value = current;
                          },
                          isSelected: isSelected,
                          text: allergy.name,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      /// 하단 버튼
      bottomNavigationBar: TapDebouncer(
        onTap: () async {
          // 알레르기 정보 업데이트
          await ref
              .read(onboardingViewModelProvider.notifier)
              .saveAllergies(selectedAllergies.value);
          // mounted 체크
          if (!context.mounted) return;
          // 페이지 이동
          isEditing ? context.go('/') : context.push('/onboarding/done');
        },
        builder: (BuildContext context, TapDebouncerFunc? onTap) {
          return DoneButton(
            onTap: onTap,
            backgroundColor: fxc(context).primary400!,
            text: isEditing ? "완료" : "다음",
            textColor: Colors.white,
          );
        },
      ),
    );
  }
}
