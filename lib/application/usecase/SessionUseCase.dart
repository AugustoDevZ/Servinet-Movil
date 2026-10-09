import 'package:flutter/rendering.dart';
import 'package:servinet_movil/application/manager/AuthManager.dart';
import 'package:servinet_movil/domain/entities/user.dart';
import 'package:servinet_movil/application/dto/auth_dto.dart';
import 'package:servinet_movil/domain/exception/ResponseInvalidFormat.dart';
import 'package:servinet_movil/domain/exception/UnauthorizedException.dart';
import 'package:servinet_movil/infraestructure/repositories/AuthRepositoryImpl.dart';

class SessionUseCase {
  static User? _actualUser;
  static final isMail = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  static Future<User?> login(String userOrEmail, String pass) async {
    final user;
    final mail;

    if (isMail.hasMatch(userOrEmail)) {
      mail = userOrEmail;
      user = null;
    } else {
      mail = null;
      user = userOrEmail;
    }

    final AuthDto authDto = AuthDto(
      username: user,
      password: pass,
      usermail: mail,
    );

    AuthManager authManager = AuthManager(AuthRepositoryImpl());
    _actualUser = await authManager.login(authDto);

    return _actualUser;
  }

  static Future<bool?> logout() {
    _actualUser = null;
    AuthManager authManager = AuthManager(AuthRepositoryImpl());
    return authManager.logout();
  }

  static Future<bool> isActiveSessionUser() async {
    try {
      debugPrint('--- 2.1 Entró al UseCase');
      AuthManager authManager = AuthManager(AuthRepositoryImpl());
      debugPrint('-- -------- 2.2 Antes de consultar al repositorio');
      final tempUser = await authManager.isActiveSession();
      debugPrint(' -- - -- -- 2.3 Usuario recibido: $tempUser');
      _actualUser = tempUser;
      return true;
    } on UnauthorizedException {
      return false;
    } on RersponseInvalidFormat {
      return false;
    }
    //validar si la api retorno null o el usuario
  }
}
