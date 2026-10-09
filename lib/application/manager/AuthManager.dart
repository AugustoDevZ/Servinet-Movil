import 'package:servinet_movil/application/dto/auth_dto.dart';
import 'package:servinet_movil/domain/entities/user.dart';
import 'package:servinet_movil/domain/repository/UserRepository.dart';

class AuthManager {
  final UserRepository repository;

  AuthManager(this.repository);

  Future<User?> login(AuthDto authDto) async {
    return repository.login(authDto);
  }

  Future<bool?> logout() async {
    return repository.logout();
  }

  Future<User> isActiveSession() async {
    return repository.isActiveSession();
  }
}
