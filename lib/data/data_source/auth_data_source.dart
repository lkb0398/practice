import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDataSource {
  final SupabaseClient _client;

  AuthDataSource(this._client);

  Future<void> signInWithOAuth(OAuthProvider provider) async {
    await _client.auth.signInWithOAuth(
      provider,
      redirectTo: 'io.supabase.vitameal://login-callback',
      authScreenLaunchMode: LaunchMode.externalApplication,
    );
  }

  Future<void> signOut() async => await _client.auth.signOut();

  Future<void> withdraw() async {
    try {
      // Supabase SQL Editor에서 만든 'delete_user_account' 함수 호출
      await _client.rpc('delete_user_account');

      // 계정을 삭제했으니 로컬 기기의 세션도 로그아웃해서 정리
      await signOut();
    } catch (e) {
      rethrow;
    }
  }

  Stream<Session?> get sessionStream =>
      _client.auth.onAuthStateChange.map((event) => event.session);
  Session? get currentSession => _client.auth.currentSession;
}
