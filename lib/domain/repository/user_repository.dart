import 'package:servinet_movil/domain/entities/user.dart';
import 'package:servinet_movil/application/dto/auth_dto.dart';

abstract interface class UserRepository {
  Future<User> login(AuthDto authDto);
  Future<bool> logout();
  Future<User> isActiveSession();
}
