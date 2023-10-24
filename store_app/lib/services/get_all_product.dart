import 'package:dio/dio.dart';
import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/product.dart';

class AllProductsService {
  final dio = Dio();
  final url = 'https://fakestoreapi.com/products';

  Future<List<Product>> getAllProudct() async {
    final response = await Api().get(url);

    var jsonData = response.data;
    List<Product> productsList = [];

    for (var item in jsonData) {
      productsList.add(Product.fromJson(item));
    }
    print(productsList[0].price);
    return productsList;
  }
}
