import 'dart:convert';

class Food {
  String name;
  int price;
  int categorie;
  String image;

  Food({
    required this.name,
    required this.price,
    required this.categorie,
    required this.image,
  });

  Food copyWith({
    String? name,
    int? price,
    int? categorie,
    String? image,
  }) =>
      Food(
        name: name ?? this.name,
        price: price ?? this.price,
        categorie: categorie ?? this.categorie,
        image: image ?? this.image,
      );

  factory Food.fromRawJson(String str) => Food.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        name: json["name"],
        price: json["price"],
        categorie: json["categorie"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "categorie": categorie,
        "image": image,
      };
}
