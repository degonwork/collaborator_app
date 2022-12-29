const String tableDistrict = 'district';

class DistrictField {
  static final List<String> values = [
    name,
    type,
    slug,
    path,
    districtId,
    parentId
  ];
  static const String name = 'name';
  static const String type = 'type';
  static const String slug = 'slug';
  static const String path = 'path';
  static const String districtId = 'districtId';
  static const String parentId = 'parentId';
}

class District {
  District({
    required this.name,
    required this.type,
    required this.slug,
    required this.path,
    required this.districtId,
    required this.parentId,
  });

  final String? name;
  final String? type;
  final String? slug;
  final String? path;
  final String? districtId;
  final String? parentId;

  static District fromJson(Map<String, dynamic> json) => District(
        name: json["name"],
        type: typeValues.map[json["type"]],
        slug: json["slug"],
        path: json["path"],
        districtId: json["code"] ?? json["districtId"],
        parentId: json["parent_code"] ?? json["parentId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": typeValues.reverse[type],
        "slug": slug,
        "path": path,
        "districtId": districtId,
        "parentId": parentId,
      };
}

Map<String, dynamic> typeDistrict = {
  "quan": "Quận",
  "huyen": "Huyện",
  "thi-xa": "Thị Xã",
  "thanh-pho": "Thành Phố",
};

final typeValues = EnumValues({
  "quan": typeDistrict['quan'],
  "huyen": typeDistrict['huyen'],
  "thi-xa": typeDistrict['thi-xa'],
  "thanh-pho": typeDistrict['thanh-pho']
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
