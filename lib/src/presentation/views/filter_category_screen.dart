import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/src/data/food_app/food_app_cubit.dart';
import 'package:food_app/src/data/models/category.dart';
import 'package:food_app/src/presentation/common/card_food.dart';

class FilterCategoryScreen extends StatelessWidget {
  const FilterCategoryScreen({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    final blocFoodApp = context.watch<FoodAppCubit>();
    final foods = blocFoodApp.getFoodByCategory(category.id);
    return ListView.builder(
      padding: const EdgeInsets.only(top: 20),
      itemCount: foods.length,
      itemBuilder: ((context, index) {
        return CardFood(food: foods[index]);
      }),
      addAutomaticKeepAlives: true,
      cacheExtent: 250,
    );
  }
}
