import 'package:servinet_movil/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<User> login(String email, String password);
}
