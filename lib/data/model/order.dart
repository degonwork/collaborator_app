const String tableOrder = 'orders';

class OrderField {
  static final List<String> values = [
    id,
    userId,
    totalPrice,
    transportFee,
    time,
    customerName,
    phoneCustomer,
    addressCustomer,
    transportCode,
    statusOrder
  ];
  static const String id = 'id';
  static const String userId = 'userId';
  static const String totalPrice = 'totalPrice';
  static const String transportFee = 'transportFee';
  static const String time = 'time';
  static const String customerName = 'customerName';
  static const String phoneCustomer = 'phoneCustomer';
  static const String addressCustomer = 'addressCustomer';
  static const String transportCode = 'transportCode';
  static const String statusOrder = 'statusOrder';
}

class Order {
  final int? id;
  final int? userId;
  final int? totalPrice;
  final int? transportFee;
  final String? time;
  final String? customerName;
  final String? phoneCustomer;
  final String? addressCustomer;
  final int? transportCode;
  String? statusOrder;

  Order({
    required this.id,
    required this.userId,
    required this.totalPrice,
    required this.time,
    required this.customerName,
    required this.phoneCustomer,
    required this.addressCustomer,
    required this.transportCode,
    required this.statusOrder,
    required this.transportFee,
  });

  static Order fromJson(Map<String, dynamic> json) => Order(
        id: json['id'],
        userId: json['userId'],
        totalPrice: json['totalPrice'],
        transportFee: json['transportFee'],
        time: json['time'],
        customerName: json['customerName'],
        phoneCustomer: json['phoneCustomer'],
        addressCustomer: json['addressCustomer'],
        transportCode: json['transportCode'],
        statusOrder: json['statusOrder'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'totalPrice': totalPrice,
        'transportFee': transportFee,
        'time': time,
        'customerName': customerName,
        'phoneCustomer': phoneCustomer,
        'addressCustomer': addressCustomer,
        'transportCode': transportCode,
        'statusOrder': statusOrder,
      };
}
