import 'dart:convert';

class Category {
  int id;
  String name;
  String color;
  String image;

  Category({
    required this.id,
    required this.name,
    required this.color,
    required this.image,
  });

  Category copyWith({
    int? id,
    String? name,
    String? color,
    String? image,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        image: image ?? this.image,
      );

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        color: json["color"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
        "image": image,
      };
}
