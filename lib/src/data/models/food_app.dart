import 'dart:convert';

import 'models.dart';

class FoodApp {
  List<String> banner;
  List<Category> categories;
  List<Food> food;

  FoodApp({
    required this.banner,
    required this.categories,
    required this.food,
  });

  FoodApp copyWith({
    List<String>? banner,
    List<Category>? categories,
    List<Food>? food,
  }) =>
      FoodApp(
        banner: banner ?? this.banner,
        categories: categories ?? this.categories,
        food: food ?? this.food,
      );

  factory FoodApp.fromRawJson(String str) => FoodApp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FoodApp.fromJson(Map<String, dynamic> json) => FoodApp(
        banner: List<String>.from(json["banner"].map((x) => x)),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        food: List<Food>.from(json["food"].map((x) => Food.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banner": List<dynamic>.from(banner.map((x) => x)),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "food": List<dynamic>.from(food.map((x) => x.toJson())),
      };
}
