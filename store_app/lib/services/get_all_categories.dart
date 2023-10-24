import 'package:dio/dio.dart';
import 'package:store_app/helpers/api.dart';

class AllCategoriesService {
  final dio = Dio();
  final url = 'https://fakestoreapi.com/products/categories';

  Future<List<dynamic>> getAllCategories() async {
    final response = await Api().get(url);
    var jsonData = response.data;
    List categoriesList = [];

    for (var item in jsonData) {
      categoriesList.add(item);
    }
    print(categoriesList[0]);
    return categoriesList;
  }
}
