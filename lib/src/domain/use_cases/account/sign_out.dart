
import 'package:blogbox/src/domain/repositories/auth_repository.dart';

class SignOut {
  final AuthRepository _authRepository;

  SignOut(this._authRepository);

  Future<void> call() async {
    try{
      await _authRepository.signOut();
    }catch(e){
      throw Exception();
    }
  }
}