import 'package:food_app/src/data/models/models.dart';
import 'package:food_app/src/domain/repository/food_repository.dart';
import 'package:http/http.dart' as http;

class FoodService extends FoodApiRepository {
  @override
  Future<FoodApp> fetchApi() async {
    final resp =
        await http.get(Uri.parse('https://tutofox.com/foodapp/api.php'));
    return FoodApp.fromRawJson(resp.body);
  }
}
