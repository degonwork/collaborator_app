import 'dart:convert';

const String tableProduct = 'products';

class ProductField {
  static final List<String> values = [
    id,
    code,
    commentsCount,
    createdAt,
    imageUrls,
    name,
    price,
    slug,
    stock,
    updatedAt,
    weight,
  ];
  static const String id = 'id';
  static const String code = 'code';
  static const String commentsCount = 'comments_count';
  static const String createdAt = 'created_at';
  static const String imageUrls = 'image_urls';
  static const String name = 'name';
  static const String price = 'price';
  static const String slug = 'slug';
  static const String stock = 'stock';
  static const String updatedAt = 'updated_at';
  static const String weight = 'weight';
}

class Product {
  Product({
    required this.categories,
    required this.code,
    required this.createdAt,
    required this.commentsCount,
    required this.id,
    required this.imageUrls,
    required this.name,
    required this.price,
    required this.slug,
    required this.stock,
    required this.updatedAt,
    required this.weight,
  });
  final List<dynamic>? categories;
  final String? code;
  final int? commentsCount;
  final DateTime? createdAt;
  final int id;
  final List<dynamic>? imageUrls;
  final String? name;
  final int? price;
  final String? slug;
  final int? stock;
  final DateTime? updatedAt;
  final int? weight;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        categories: json["categories"] != null
            ? List<dynamic>.from(json["categories"].map((x) => x))
            : [],
        code: json["code"],
        commentsCount: json["comments_count"],
        createdAt: json["created_at"] != null
            ? json["created_at"] is String
                ? DateTime.parse(json["created_at"])
                : DateTime.fromMillisecondsSinceEpoch(json["created_at"],
                    isUtc: true)
            : null,
        id: json["id"],
        imageUrls: json["image_urls"] != null
            ? json["image_urls"] is String
                ? json["image_urls"]!.isNotEmpty
                    ? jsonDecode(json["image_urls"]).cast<String>().toList()
                    : []
                : List<dynamic>.from(json["image_urls"].map((x) => x))
            : [],
        name: json["name"],
        price: json["price"],
        slug: json["slug"],
        stock: json["stock"],
        updatedAt: json["updated_at"] != null
            ? json["updated_at"] is String
                ? DateTime.parse(json["updated_at"])
                : DateTime.fromMillisecondsSinceEpoch(json["updated_at"],
                    isUtc: true)
            : null,
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "code": code ?? "",
        "comments_count": commentsCount ?? 0,
        "created_at": createdAt != null ? createdAt!.millisecondsSinceEpoch : 0,
        "id": id,
        "image_urls": imageUrls != null
            ? imageUrls!.isEmpty
                ? ''
                : List<dynamic>.from(imageUrls!.map((x) => x)).toString()
            : '',
        "name": name ?? "",
        "price": price ?? 0,
        "slug": slug ?? "",
        "stock": stock ?? 0,
        "updated_at": updatedAt != null ? updatedAt!.millisecondsSinceEpoch : 0,
        "weight": weight ?? 0,
      };
}
