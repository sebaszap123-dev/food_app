/// A simple request from a mini api
import 'package:food_app/src/data/models/food_app.dart';

abstract class FoodApiRepository {
  Future<FoodApp> fetchApi();
}
