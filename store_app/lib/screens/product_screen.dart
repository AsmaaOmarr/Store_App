// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:store_app/constants.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({
    Key? key,
  }) : super(key: key);

  static String id = "ProductScreen";

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String? title, des, img, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;

    title = product.title;
    des = product.description;
    img = product.image;
    price = product.price.toString();

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            color: kAppBarWidgets,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Update Product ${product.id}',
            style: TextStyle(
              color: kAppBarWidgets,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  product.image,
                  height: 200,
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(' Rating ${product.rating!.rate}')
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                CustomTextField(
                  labelText: "title",
                  onChanged: (data) {
                    title = data;
                  },
                  defaultValue: title!,
                ),
                CustomTextField(
                  labelText: "description",
                  onChanged: (data) {
                    des = data;
                  },
                  defaultValue: des!,
                ),
                CustomTextField(
                  inputType: TextInputType.number,
                  labelText: "price",
                  onChanged: (data) {
                    price = data;
                  },
                  defaultValue: price!.toString(),
                ),
                CustomTextField(
                  labelText: "image",
                  onChanged: (data) {
                    img = data;
                  },
                  defaultValue: img!,
                ),
                CustomButton(
                  buttonName: 'Apply Changes',
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      await updateProductMethod(product);
                      print("success");
                    } catch (e) {
                      print("erreo ${e.toString()}");
                    }
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProductMethod(Product product) async {
    await UpdateProductService().updateProduct(
      id: product.id,
      title: title == null ? product.title : title!,
      price: price == null ? product.price.toString() : price!,
      description: des == null ? product.description : des!,
      image: img == null ? product.image : img!,
      category: product.category,
    );
  }
}
