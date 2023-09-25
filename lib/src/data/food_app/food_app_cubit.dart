import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/src/domain/services/food_service.dart';

import '../models/models.dart';

part 'food_app_state.dart';

class FoodAppCubit extends Cubit<FoodAppState> {
  FoodAppCubit() : super(FoodAppState());

  Future<FoodApp> getApp() async {
    final getCurrentState = FoodAppState();
    emit(FoodAppState(status: FoodAppStatus.loading));
    try {
      final app = await getCurrentState.service.fetchApi();
      emit(FoodAppState(
        status: FoodAppStatus.success,
        app: app,
      ));
      return app;
    } catch (e) {
      throw Exception('Tenias un solo trabajo y no jalaste');
    }
  }

  List<Food> getFoodByCategory(int id) {
    final filterByCategoryFood =
        state.app!.food.where((category) => category.categorie == id).toList();
    return filterByCategoryFood;
  }
}
