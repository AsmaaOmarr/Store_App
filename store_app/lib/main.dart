// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app/screens/home_screen.dart';
import 'package:store_app/screens/product_screen.dart';
import 'package:store_app/screens/search_screen.dart';
import 'package:store_app/services/add_product.dart';
import 'package:store_app/services/get_all_categories.dart';
import 'package:store_app/services/get_all_product.dart';
import 'package:store_app/services/get_category.dart';

void main() {
  //AllProductsService().getAllProudct();
  // AllCategoriesService().getAllCategories();
  // CategoriesService().getProductByCategory("jewelery");
  // AddProductService().addProduct(
  //     title: 'test',
  //     price: '5.0',
  //     description: 'test',
  //     image: 'test',
  //     category: 'test');
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        ProductScreen.id: (context) => ProductScreen(),
        SearchScreen.id :(context) => SearchScreen(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}
