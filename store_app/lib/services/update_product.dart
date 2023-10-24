import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/product.dart';

class UpdateProductService {
  Future<Product> updateProduct(
      {required int id,
      required String title,
      required String price,
      required String description,
      required String image,
      required String category,}) async {
    var jsonData =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', data: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category,

    });
    print('aaaaaaaaaaaaaaaa');
    print(jsonData);
    return Product.fromJson(jsonData);
  }
}
