import 'package:servinet_movil/domain/entities/client_plan.dart';
import 'package:servinet_movil/domain/enums/installation_enum.dart';

class InstallationDto {
  final String id;
  final String technicalUuid;
  final OrderStatus orderStatus;

  final String clientName;
  final String clientAddress;
  final String clientDni;
  final ClientPlan clientPlan;
  final String idAntena;
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
    required this.idAntena,
    required this.phone,
    required this.InstallationDuration,
    required this.InstallationStart,
    required this.InstallationEnd,
  });

 
}
