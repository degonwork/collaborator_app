const String tableWard = 'ward';

class WardField {
  static final List<String> values = [
    name,
    type,
    slug,
    path,
    wardId,
    parentId,
  ];
  static const String name = 'name';
  static const String type = 'type';
  static const String slug = 'slug';
  static const String path = 'path';
  static const String wardId = 'wardId';
  static const String parentId = 'parentId';
}

class Ward {
  Ward({
    required this.name,
    required this.type,
    required this.slug,
    required this.path,
    required this.wardId,
    required this.parentId,
  });

  final String? name;
  final String? type;
  final String? slug;
  final String? path;
  final String? wardId;
  final String? parentId;

  static Ward fromJson(Map<String, dynamic> json) => Ward(
        name: json["name"],
        type: typeValues.map[json["type"]],
        slug: json["slug"],
        path: json["path"],
        wardId: json["code"] ?? json["wardId"],
        parentId: json["parent_code"] ?? json["parent_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": typeValues.reverse[type],
        "slug": slug,
        "path": path,
        "wardId": wardId,
        "parent_id": parentId,
      };
}

Map<String, dynamic> typeWard = {
  "phuong": "Phường",
  "thi-tran": "Thị trấn",
  "xa": "Xã",
};

final typeValues = EnumValues({
  "phuong": typeWard["phuong"],
  "thi-tran": typeWard["thi-tran"],
  "xa": typeWard["xa"],
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
   
      reverseMap = map.map((k, v) =>  MapEntry(v, k));
   
    return reverseMap!;
  }
}
