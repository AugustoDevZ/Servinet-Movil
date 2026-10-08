import 'package:servinet_movil/domain/entities/role.dart';
import 'package:servinet_movil/domain/repository/identifiable.dart';

class User implements Identifiable {
  final String uuid;
  String name;
  String email;
  final Role rol;
  final DateTime createAt;
  String? imageUrl;

  User({
    required this.uuid,
    required this.name,
    required this.email,
    required this.rol,

    required this.createAt,
    required this.imageUrl,
  });
}
