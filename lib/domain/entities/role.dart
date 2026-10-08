import 'package:servinet_movil/domain/repository/identifiable.dart';

class Role implements Identifiable {
  final String uuid;
  final String name;
  final String hexColor;

  Role({required this.uuid, required this.name, required this.hexColor});
}
