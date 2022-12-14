const String tableUser = 'users';

class UserField {
  static final List<String> values = [
    id,
    email,
    name,
    image,
    phone,
    address,
  ];
  static const String id = 'id';
  static const String email = 'email';
  static const String name = 'name';
  static const String image = 'image';
  static const String phone = 'phone';
  static const String address = 'address';
}

class User {
  final String? id;
  final String? email;
  final String? name;
  final String? phone;
  final String? address;
  final String? image;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.image,
    required this.phone,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        image: json['image'],
        phone: json['phone'],
        address: json['address'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'image': image,
        'phone': phone,
        'address': address,
      };
}
