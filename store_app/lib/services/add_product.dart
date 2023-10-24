import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/product.dart';

class AddProductService {
  Future<Product> addProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    var jsonData = Api().post(url: "https://fakestoreapi.com/products", data: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category,
    });

    print(jsonData);
    return Product.fromJson(jsonData);
  }
}
