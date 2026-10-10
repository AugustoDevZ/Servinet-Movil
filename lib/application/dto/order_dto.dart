class OrderDto {
  final String orderId;
  final DateTime orderCreate;
  final String orderStatus;

  final String clientDni;
  final String clientName;
  final String clientLastName;
  final String clientPhone;
  final String clientAddress;
  final String clientWhatsapp;

  final String planId;
  final String planName;
  final int planSpeed;
  final double planPrice;
  final bool planIsPromo;

  final String reportId;

  const OrderDto({
    required this.orderId,
    required this.orderCreate,
    required this.orderStatus,
    required this.clientDni,
    required this.clientName,
    required this.clientLastName,
    required this.clientPhone,
    required this.clientAddress,
    required this.clientWhatsapp,
    required this.planId,
    required this.planName,
    required this.planSpeed,
    required this.planPrice,
    required this.planIsPromo,
    required this.reportId,
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) {
    return OrderDto(
      orderId: json['order_id'].toString(),
      orderCreate: DateTime.parse(json['order_create'].toString()),
      orderStatus: json['order_status'].toString(),
      clientDni: json['client_dni'].toString(),
      clientName: json['client_name'].toString(),
      clientLastName: json['client_last_name'].toString(),
      clientPhone: json['client_phone'].toString(),
      clientAddress: json['client_address'].toString(),
      clientWhatsapp: json['client_whatsapp'].toString(),
      planId: json['plan_id'].toString(),
      planName: json['plan_name'].toString(),
      planSpeed: (json['plan_speed'] as num).toInt(),
      planPrice: (json['plan_price'] as num).toDouble(),
      planIsPromo: json['plan_ispromo'] == true || json['plan_ispromo'] == 1,
      reportId: json['report_id'].toString(),
    );
  }
}
