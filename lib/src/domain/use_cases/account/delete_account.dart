
import 'package:blogbox/src/domain/repositories/auth_repository.dart';

class DeleteAccount{
  final AuthRepository _authRepository;

  DeleteAccount(this._authRepository);

  Future<void> call() async {
    try{
      await _authRepository.deleteAccount();
    }catch(e) {
      throw Exception(e);
    }
  }
}