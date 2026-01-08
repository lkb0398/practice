import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitameal/domain/repository/auth_repository.dart';
import 'package:vitameal/data/data_source/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<void> signInWithOAuth(OAuthProvider provider) async =>
      await _dataSource.signInWithOAuth(provider);

  @override
  Future<void> signOut() async => await _dataSource.signOut();

  @override
  Future<void> withdraw() async => await _dataSource.withdraw();

  @override
  Stream<Session?> get sessionStream => _dataSource.sessionStream;

  @override
  Session? get currentSession => _dataSource.currentSession;
}
