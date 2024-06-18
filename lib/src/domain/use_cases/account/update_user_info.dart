
import 'package:blogbox/src/domain/repositories/auth_repository.dart';

class UpdateUserInfo {
  final AuthRepository _authRepository;

  UpdateUserInfo(this._authRepository);

  Future<void> call(String displayName,String photoUrl) async {
    try{
      await _authRepository.updateUserInfo(displayName,photoUrl);
    }catch(e){
      throw Exception(e);
    }
  }
}