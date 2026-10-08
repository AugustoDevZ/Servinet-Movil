import 'package:servinet_movil/domain/repository/identifiable.dart';

class User implements Identifiable {
  final String uuid;
  String name;
  final String email;
  final Role rol;
  final String passwordHash;
  final DateTime createAt;
  final String? imageUrl;
}
