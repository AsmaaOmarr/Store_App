import 'package:dio/dio.dart';
import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/product.dart';

class CategoriesService {
  final dio = Dio();

  Future<List<Product>> getProductByCategory(String categoryName) async {
    final response = await Api()
        .get('https://fakestoreapi.com/products/category/$categoryName');

    var jsonData = response.data;
    List<Product> productsList = [];

    for (var item in jsonData) {
      productsList.add(Product.fromJson(item));
    }
    print(productsList[0].price);
    return productsList;
  }
}
