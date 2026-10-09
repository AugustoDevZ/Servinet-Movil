import 'package:servinet_movil/application/usecase/SessionUseCase.dart';
import 'package:servinet_movil/domain/entities/user.dart';

class LoginController {
  Future<bool> iniciarSesion(String emailOrUser, String password) async {
    User? result = await SessionUseCase.login(
      emailOrUser.trim(),
      password.trim(),
    );

    if (result == null) {
      return false;
    }

    return true;
  }

  Future<bool> verifySessionActive() async {
    await SessionUseCase.isActiveSessionUser();
    return true;
  }
}
