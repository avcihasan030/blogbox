
import 'package:blogbox/src/domain/repositories/auth_repository.dart';

class ResetPassword {
  final AuthRepository _authRepository;

  ResetPassword(this._authRepository);

  Future<void> call(String email) async {
    try {
      await _authRepository.resetPassword(email);
    } catch (e) {
      throw Exception(e);
    }
  }
}
