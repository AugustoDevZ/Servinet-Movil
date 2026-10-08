import 'package:servinet_movil/domain/repository/identifiable.dart';

class Role implements Identifiable {
  final String uuid;

  Role({
    required this.uuid;
  });
}