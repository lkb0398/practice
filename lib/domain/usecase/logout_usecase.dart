import 'package:vitameal/domain/repository/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _repository;
  LogoutUseCase(this._repository);

  Future<void> execute() async => await _repository.signOut();
}
