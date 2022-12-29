const String tableCategory = 'categories';

class CategoryField {
  static final List<String> values = [
    id,
    name,
  ];
  static const String id = 'id';
  static const String name = 'name';
}

class Category {
  final int? id;
  final String? name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(id: json['id'], name: json['name']);

  Map<String, dynamic> toJson() => {
        'id': id,
        "name": name,
      };
}
