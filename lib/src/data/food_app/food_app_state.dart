part of 'food_app_cubit.dart';

enum FoodAppStatus { initial, loading, success, error }

class FoodAppState extends Equatable {
  final FoodAppStatus status;
  final FoodService service = FoodService();
  final FoodApp? app;
  FoodAppState({this.status = FoodAppStatus.initial, this.app});

  @override
  List<Object> get props => [status];
}
