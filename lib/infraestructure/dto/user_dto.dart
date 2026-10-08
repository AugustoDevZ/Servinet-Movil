import 'package:servinet_movil/domain/entities/role.dart';
import 'package:servinet_movil/domain/entities/user.dart';

class UserDto {
  final String uuid;
  final String name;
  final String email;
  final Role rol;
  final DateTime createAt;
  final String? imageUrl;

  UserDto({
    required this.uuid,
    required this.name,
    required this.email,
    required this.createAt,
    required this.imageUrl,
    required this.rol,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      uuid: json['user_uuid'],
      name: json['display'],
      email: json['email'],
      createAt: DateTime.parse(json['create_at']),
      imageUrl: json['perfil_img'],
      rol: new Role(
        uuid: json['role_uuid'],
        name: json['name'],
        hexColor: json['hexColor'],
      ),
    );
  }
  User toEntity() {
    return User(
      uuid: uuid,
      name: name,
      email: email,
      rol: rol,
      createAt: createAt,
      imageUrl: imageUrl,
    );
  }
}
