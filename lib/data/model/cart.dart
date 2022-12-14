import 'dart:convert';

const String tableCart = 'carts';

class CartField {
  static final List<String> values = [
    id,
    productId,
    orderId,
    productName,
    productImage,
    unitPrice,
    quantity,
    isExisted,
  ];
  static const String id = 'id';
  static const String productId = 'productId';
  static const String orderId = 'orderId';
  static const String productName = 'productName';
  static const String productImage = 'productImage';
  static const String unitPrice = 'unitPrice';
  static const String quantity = 'quantity';
  static const String isExisted = 'isExisted';
}

class Cart {
  final int? id;
  final int? productId;
  final int? orderId;
  final String? productName;
  final List<dynamic>? productImage;
  final int? unitPrice;
  int quantity;
  bool? isExisted;

  Cart({
    required this.id,
    required this.productId,
    required this.orderId,
    required this.productName,
    required this.productImage,
    required this.unitPrice,
    required this.quantity,
    required this.isExisted,
  });

  static Cart fromJson(Map<String, dynamic> json) => Cart(
        id: json['id'],
        productId: json['productId'],
        orderId: json['orderId'],
        productName: json['productName'],
        productImage: json["productImage"]!.isNotEmpty
            ? List<dynamic>.from(jsonDecode(json["productImage"])
                .cast<String>()
                .toList()
                .map((x) => x))
            : [],
        unitPrice: json['unitPrice'],
        quantity: json['quantity'],
        isExisted: json['isExisted'] == 1 ? true : false,
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'productId': productId,
        'orderId': orderId,
        'productName': productName ?? "",
        'productImage': productImage!.isNotEmpty
            ? List<dynamic>.from(productImage!.map((x) => x)).toString()
            : "",
        'unitPrice': unitPrice,
        'quantity': quantity,
        'isExisted': isExisted == true ? 1 : 0,
      };
}
