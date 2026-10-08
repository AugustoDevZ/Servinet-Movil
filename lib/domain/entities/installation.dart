import 'package:servinet_movil/domain/entities/client_plan.dart';
import 'package:servinet_movil/domain/entities/role.dart';
import 'package:servinet_movil/domain/entities/user.dart';
import 'package:servinet_movil/domain/enums/installation_enum.dart';

class InstallationDto {
  final String id;
  final String technicalUuid;
  final OrderStatus orderStatus;

  final String clientName;
  final String clientAddress;
  final String clientDni;
  final ClientPlan clientPlan;
  final String phone;

  DateTime InstallationDuration;
  DateTime InstallationStart;
  DateTime InstallationEnd;

  InstallationDto({
    required this.id,
    required this.technicalUuid,
    required this.orderStatus,
    required this.clientName,
    required this.clientAddress,
    required this.clientDni,
    required this.clientPlan,
    required this.phone,
    required this.InstallationDuration,
    required this.InstallationStart,
    required this.InstallationEnd,
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
