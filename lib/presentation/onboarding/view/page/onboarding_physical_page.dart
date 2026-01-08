import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tap_debouncer/tap_debouncer.dart';
import 'package:vitameal/core/theme/app_theme.dart';
import 'package:vitameal/domain/enum/gender_type_enum.dart';
import 'package:vitameal/presentation/onboarding/view/widget/select_box.dart';
import 'package:vitameal/presentation/widget/button/done_button.dart';
import 'package:vitameal/presentation/widget/validate_textformfield.dart';
import 'package:vitameal/presentation/ui_provider/profiles_provider.dart';
import 'package:vitameal/presentation/onboarding/viewmodel/onboarding_view_model.dart';

class OnboardingPhysicalPage extends HookConsumerWidget {
  const OnboardingPhysicalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 성별 : 사용자 선택값 (기본값 남성)
    final selectedGender = useState<GenderType>(GenderType.male);

    // 출생년도 : 사용자 입력값 받기 + 검증 메시지
    final birthyearController = useTextEditingController();
    String? validateBirthYear(String? value) {
      if (value == null || value.isEmpty) {
        return '출생 연도를 입력해주세요.'; // 입력값 없을 때
      }
      if (value.length != 4) {
        return '출생 연도는 4자리 숫자여야 해요.'; // 입력 형식 제한
      }
      final year = int.tryParse(value);
      if (year == null) {
        return '숫자를 입력해주세요.'; // 숫자가 아닐 때
      }
      if (year < 1900 || year > DateTime.now().year) {
        return '올바른 출생 연도를 입력해주세요.'; // 입력 범위 제한 (1900~현재년도)
      }
      return null; // 통과
    }

    // 키 : 사용자 입력값 받기 + 검증 메시지
    final heightController = useTextEditingController();
    String? validateHeight(String? value) {
      if (value == null || value.isEmpty) {
        return '잘못된 숫자입니다.'; // 입력값 없을 때
      }
      final height = double.tryParse(value);
      if (height == null) {
        return '잘못된 숫자입니다.'; // 숫자가 아닐 때
      }
      if (height < 0 || height > 300) {
        return '잘못된 숫자입니다.'; // 입력 범위 제한 (0~300)
      }
      return null; // 통과
    }

    // 몸무게 : 사용자 입력값 받기 + 검증 메시지
    final weightController = useTextEditingController();
    String? validateWeight(String? value) {
      if (value == null || value.isEmpty) {
        return '잘못된 숫자입니다.'; // 입력값 없을 때
      }
      final weight = double.tryParse(value);
      if (weight == null) {
        return '잘못된 숫자입니다.'; // 숫자가 아닐 때
      }
      if (weight < 0 || weight > 300) {
        return '잘못된 숫자입니다.'; // 입력 범위 제한 (0~300)
      }
      return null; // 통과
    }

    // 버튼 활성화 여부
    final isButtonEnabled = useState(false);
    useEffect(() {
      void listener() {
        final birthYear = birthyearController.text.trim();
        final height = heightController.text.trim();
        final weight = weightController.text.trim();

        final isValid =
            validateBirthYear(birthYear) == null &&
            validateHeight(height) == null &&
            validateWeight(weight) == null;

        isButtonEnabled.value = isValid;
      }

      birthyearController.addListener(listener);
      heightController.addListener(listener);
      weightController.addListener(listener);

      return () {
        birthyearController.removeListener(listener);
        heightController.removeListener(listener);
        weightController.removeListener(listener);
      };
    }, []);

    // 수정모드 여부
    final isEditing = ref.watch(isEditFlowProvider);

    // 수정모드 시 기존값 불러오기
    final profileAsync = ref.watch(myProfileProvider);
    final didInit = useRef(false);
    useEffect(() {
      if (!isEditing) return null;
      profileAsync.whenData((profile) {
        if (profile == null) return;
        if (didInit.value) return;
        didInit.value = true;
        if (profile.gender != null) {
          selectedGender.value = profile.genderType!;
        }
        if (profile.birthYear != null) {
          birthyearController.text = profile.birthYear.toString();
        }
        if (profile.heightCm != null) {
          heightController.text = profile.heightCm!.toString();
        }
        if (profile.weightKg != null) {
          weightController.text = profile.weightKg!.toString();
        }
        isButtonEnabled.value = true;
      });
      return null;
    }, [isEditing, profileAsync]);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
          child: SingleChildScrollView(
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
                          text: '2',
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
                            TextSpan(text: '반갑습니다, '),
                            TextSpan(
                              text: profileAsync.when(
                                data: (profile) => "${profile?.nickname}",
                                loading: () => "회원",
                                error: (_, __) => "회원",
                              ),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: '님!\n기본 정보를 입력해주세요.'),
                          ],
                        ),
                      ),
                SizedBox(height: 20),

                /// 성별 선택
                Text("성별", style: TextStyle(fontSize: 16)),
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SelectBox(
                        onTap: () async =>
                            selectedGender.value = GenderType.male,
                        isSelected: selectedGender.value == GenderType.male,
                        text: "남성",
                        height: 50,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SelectBox(
                        onTap: () async =>
                            selectedGender.value = GenderType.female,
                        isSelected: selectedGender.value == GenderType.female,
                        text: "여성",
                        height: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                /// 출생년도 입력창
                Text("출생 연도", style: TextStyle(fontSize: 16)),
                ValidateTextformfield(
                  readOnly: false,
                  hintText: "1988",
                  validator: validateBirthYear,
                  controller: birthyearController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // 숫자만
                    LengthLimitingTextInputFormatter(4), // 정수 4자리만
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    /// 키 입력창
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Text("키", style: TextStyle(fontSize: 16)),
                            ValidateTextformfield(
                              readOnly: false,
                              hintText: "180.0",
                              validator: validateHeight,
                              controller: heightController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  // 정수 3자리 + 소수점 1자리 까지
                                  RegExp(r'^\d{0,3}\.?\d{0,1}$'),
                                ),
                              ],
                              unit: "cm",
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// 몸무게 입력창
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Text("몸무게", style: TextStyle(fontSize: 16)),
                            ValidateTextformfield(
                              readOnly: false,
                              hintText: "80.0",
                              validator: validateWeight,
                              controller: weightController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  // 정수 3자리 + 소수점 1자리
                                  RegExp(r'^\d{0,3}\.?\d{0,1}$'),
                                ),
                              ],
                              unit: "kg",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      /// 하단 버튼
      bottomNavigationBar: TapDebouncer(
        onTap: isButtonEnabled.value
            ? () async {
                final birthYear = birthyearController.text.trim();
                final heightCm = heightController.text.trim();
                final weightKg = weightController.text.trim();
                // 프로필 업데이트
                await ref
                    .read(onboardingViewModelProvider.notifier)
                    .updateProfile(
                      gender: selectedGender.value,
                      birthYear: int.tryParse(birthYear),
                      heightCm: double.tryParse(heightCm),
                      weightKg: double.tryParse(weightKg),
                    );
                // mounted 체크
                if (!context.mounted) return;
                // 페이지 이동
                isEditing
                    ? context.push('/edit/disease')
                    : context.push('/onboarding/disease');
              }
            : null,
        builder: (BuildContext context, TapDebouncerFunc? onTap) {
          return DoneButton(
            onTap: onTap,
            backgroundColor: isButtonEnabled.value
                ? fxc(context).primary400!
                : fxc(context).textcolor300!,
            text: "다음",
            textColor: Colors.white,
          );
        },
      ),
    );
  }
}
