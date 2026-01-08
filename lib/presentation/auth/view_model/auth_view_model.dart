import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitameal/core/di/provider.dart';
import 'package:vitameal/core/service/firebase_service.dart';

part 'auth_view_model.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  // 로딩 상태 관리를 위한 내부 변수
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @override
  Session? build() {
    // Repository의 세션 스트림 감시
    final repository = ref.watch(authRepositoryProvider);

    // Supabase 인증 상태 변화를 구독 & ViewModel의 state를 동기화
    final subscription = repository.sessionStream.listen((session) {
      state = session; // 세션이 바뀌면 자동으로 state가 업데이트되고 UI가 반응
    });

    // ViewModel이 해제될 때 구독도 같이 취소 (메모리 누수 방지)
    ref.onDispose(() {
      subscription.cancel();
    });

    // 초기값으로 현재 세션 반환
    return repository.currentSession;
  }

  Future<void> login(OAuthProvider provider, {VoidCallback? onError}) async {
    if (_isLoading) return;

    _isLoading = true;
    // 상태가 변경되었음을 알림 (LoginPage의 vm.isLoading을 리빌드하기 위함)
    ref.notifyListeners();

    try {
      final loginUseCase = ref.read(loginUseCaseProvider);
      await loginUseCase.execute(provider);
      // 로그인 성공 직후 강제 토큰 저장 (앱 삭제 후 재설치 시 토큰 갱신 위해)
      await FirebaseService.saveFcmToken();
    } catch (e) {
      debugPrint('로그인 에러: $e');
      if (onError != null) onError();
    } finally {
      _isLoading = false;
      ref.notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      final logoutUseCase = ref.read(logoutUseCaseProvider);
      await logoutUseCase.execute();
      // 로그아웃 시 state는 sessionStream의 listen에 의해 자동으로 null
    } catch (e) {
      debugPrint('로그아웃 에러: $e');
    }
  }

  Future<void> withdraw({
    VoidCallback? onSuccess,
    VoidCallback? onError,
  }) async {
    if (_isLoading) return;

    _isLoading = true;
    ref.notifyListeners();

    try {
      final repository = ref.read(authRepositoryProvider);
      await repository.withdraw();

      state = null;

      if (onSuccess != null) onSuccess();
    } catch (e) {
      debugPrint('회원 탈퇴 에러: $e');
      if (onError != null) onError();
    } finally {
      _isLoading = false;
      ref.notifyListeners();
    }
  }
}
