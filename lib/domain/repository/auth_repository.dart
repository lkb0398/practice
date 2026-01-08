import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<void> signInWithOAuth(OAuthProvider provider);
  Future<void> signOut();
  Future<void> withdraw();
  Stream<Session?> get sessionStream;
  Session? get currentSession;
}
