
import 'package:blogbox/src/domain/repositories/auth_repository.dart';

class SignupWithCredentials {
  final AuthRepository _authRepository;

  SignupWithCredentials(this._authRepository);

  Future<void> call(String email,String password) async {
    try{
      await _authRepository.signInWithEmailAndPassword(email, password);
    }catch(e) {
      throw Exception(e);
    }
  }
}