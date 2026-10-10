class OrderAcceptedDto {
  final String? uuid;
  final String? technical;

  OrderAcceptedDto({required this.uuid, required this.technical});

  Map<String, dynamic> toJson() {
    return {'uuid_order': uuid, 'technical': technical};
  }
}
