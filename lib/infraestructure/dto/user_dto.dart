import 'package:servinet_movil/domain/entities/role.dart';
import 'package:servinet_movil/domain/entities/user.dart';

class UserDto {
  final String uuid;
  final String name;
  final String email;
  final Role rol;
  final String passwordHash;
  final DateTime createAt;
  final String? imageUrl;

  UserDto({
    required this.uuid,
    required this.name,
    required this.email,
    required this.rol,
    required this.passwordHash,
    required this.createAt,
    required this.imageUrl,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      uuid: json['uuid'],
      name: json['name'],
      email: json['email'],
      rol: json['rol'],
      passwordHash: json['passwordHash'],
      createAt: DateTime.parse(json['createAt']),
      imageUrl: json['imageUrl'],
    );
  }
  User toEntity() {
    return User(
      uuid: uuid,
      name: name,
      email: email,
      rol: rol,
      passwordHash: passwordHash,
      createAt: createAt,
      imageUrl: imageUrl,
    );
  }
}
