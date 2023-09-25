import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/src/data/food_app/food_app_cubit.dart';
import 'package:food_app/src/presentation/common/card_food.dart';

class AllFoodScreen extends StatelessWidget {
  const AllFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blocFoodApp = context.watch<FoodAppCubit>();
    bool isReady = blocFoodApp.state.status == FoodAppStatus.success;

    return isReady
        ? ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            itemBuilder: ((context, index) {
              final List<int> randomIndices = List.generate(
                  blocFoodApp.state.app!.food.length, (index) => index);
              randomIndices.shuffle(); // Mezcla los índices en orden aleatorio
              final randomIndex =
                  randomIndices[index]; // Obtiene el índice aleatorio válido

              return CardFood(food: blocFoodApp.state.app!.food[randomIndex]);
            }),
            itemCount: blocFoodApp.state.app!.food.length,
            addAutomaticKeepAlives: true,
            cacheExtent: 250,
          )
        : blocFoodApp.state.status == FoodAppStatus.loading
            ? const Center(child: CircularProgressIndicator())
            : Container();
  }
}
