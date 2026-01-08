import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vitameal/presentation/info/view/widget/tag_chip.dart';
import 'package:vitameal/presentation/ui_provider/profiles_provider.dart';
import 'package:vitameal/presentation/info/view/widget/bordered_container.dart';

class ViewInfo extends HookConsumerWidget {
  const ViewInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 사용자 정보 불러오기
    final profileAsync = ref.watch(myProfileProvider);
    final diseasesAsync = ref.watch(userSelectedDiseasesProvider);
    final allergiesAsync = ref.watch(userSelectedAllergiesProvider);

    String formatNumber(double value) {
      if (value % 1 == 0) {
        return value.toInt().toString(); // 소수점 없음
      }
      return value.toString(); // 소수점 있음
    }

    return Column(
      spacing: 20,
      children: [
        /// 프로필 이미지 + 닉네임
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
            onTap: () {
              context.push('/edit/profile');
            },
            child: Row(
              spacing: 10,
              children: [
                profileAsync.when(
                  data: (profile) {
                    return profile!.photoUrl == null
                        ? Image.asset(
                            'assets/images/profile_image_small.webp',
                            height: 48,
                            width: 48,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              profile.photoUrl!,
                              height: 48,
                              width: 48,
                            ),
                          );
                  },
                  loading: () {
                    return Image.asset(
                      'assets/images/profile_image_small.webp',
                      height: 48,
                      width: 48,
                    );
                  },
                  error: (_, __) {
                    return Image.asset(
                      'assets/images/profile_image_small.webp',
                      height: 48,
                      width: 48,
                    );
                  },
                ),

                profileAsync.when(
                  data: (profile) => Text(
                    "${profile?.nickname}",
                    style: TextStyle(fontSize: 20),
                  ),
                  loading: () => const Text("정보를 불러오는 중.."),
                  error: (_, __) => const Text("정보를 불러오는 데 실패했습니다"),
                ),
              ],
            ),
          ),
        ),

        BorderedContainer(
          title: "내 정보",
          onTap: () => context.push('/edit/physical'),
          child: Column(
            spacing: 10,
            children: [
              /// 기본 정보
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: profileAsync.when(
                  data: (profile) => Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "${profile!.gender}  "),
                        TextSpan(
                          text: "${profile.age}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: " 세  "),
                        TextSpan(
                          text: formatNumber(profile.heightCm!),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: " cm  "),
                        TextSpan(
                          text: formatNumber(profile.weightKg!),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: " kg"),
                      ],
                    ),
                  ),

                  loading: () => const Text("정보를 불러오는 중.."),
                  error: (_, __) => const Text("정보를 불러오는 데 실패했습니다"),
                ),
              ),

              /// 질환 + 알레르기
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: diseasesAsync.when(
                  data: (diseases) {
                    return allergiesAsync.when(
                      data: (allergies) {
                        final tags = [
                          ...diseases.map(
                            (e) => UserTag(label: e, type: TagType.disease),
                          ),
                          ...allergies.map(
                            (e) => UserTag(label: e, type: TagType.allergy),
                          ),
                        ];

                        return Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: tags.map((e) => TagChip(e)).toList(),
                        );
                      },
                      loading: () => const CircularProgressIndicator(),
                      error: (_, __) => const Text('알레르기 로딩 실패'),
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (_, __) => const Text('질병 로딩 실패'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
