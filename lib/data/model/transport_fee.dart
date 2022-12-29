class TransportFee {
  final bool? success;
  final String? message;
  final Fee? fee;

  TransportFee(
      {required this.success, required this.message, required this.fee});

  factory TransportFee.fromJson(Map<String, dynamic> json) => TransportFee(
        success: json["success"],
        message: json["message"],
        fee: Fee.fromJson(json["fee"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "fee": fee!.toJson(),
      };
}

class Fee {
  final String? name;
  final int? fee;
  final int? insuranceFee;
  final dynamic includeVat;
  final dynamic costId;
  final String? deliveryType;
  final String? a;
  final String? dt;
  final List<dynamic>? extFees;
  final int? shipFeeOnly;
  final String? promotionKey;
  final double? distance;
  final bool? delivery;

  Fee({
    required this.name,
    required this.fee,
    required this.insuranceFee,
    required this.includeVat,
    required this.costId,
    required this.deliveryType,
    required this.a,
    required this.dt,
    required this.extFees,
    required this.shipFeeOnly,
    required this.promotionKey,
    required this.distance,
    required this.delivery,
  });

  factory Fee.fromJson(Map<String, dynamic> json) => Fee(
        name: json["name"],
        fee: json["fee"],
        insuranceFee: json["insurance_fee"],
        includeVat: json["include_vat"],
        costId: json["cost_id"],
        deliveryType: json["delivery_type"],
        a: json["a"],
        dt: json["dt"],
        extFees: List<dynamic>.from(json["extFees"].map((x) => x)),
        shipFeeOnly: json["ship_fee_only"],
        promotionKey: json["promotion_key"],
        distance: json["distance"],
        delivery: json["delivery"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "fee": fee,
        "insurance_fee": insuranceFee,
        "include_vat": includeVat,
        "cost_id": costId,
        "delivery_type": deliveryType,
        "a": a,
        "dt": dt,
        "extFees": List<dynamic>.from(extFees!.map((x) => x)),
        "ship_fee_only": shipFeeOnly,
        "promotion_key": promotionKey,
        "distance": distance,
        "delivery": delivery,
      };
}
