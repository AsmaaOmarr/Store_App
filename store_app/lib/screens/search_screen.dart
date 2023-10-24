// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/services/get_category.dart';
import 'package:store_app/widgets/custom_card.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  static String id = 'SearchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();

  String categoryName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: TextField(
            controller: controller,
            onSubmitted: (String data) {
              categoryName = data;
              setState(() {});
            },
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Search",
            )),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                categoryName = controller.text;
                setState(() {});
              },
              child: Icon(
                Icons.search_rounded,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: categoryName == ''
          ? Center(
              child: Text("what are you looking for 👀"),
            )
          : FutureBuilder<List<Product>>(
              future: CategoriesService().getProductByCategory(categoryName),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Product> pList = snapshot.data!;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 1.9,
                      mainAxisSpacing: 28,
                    ),
                    itemCount: pList.length,
                    itemBuilder: (context, index) {
                      return CustomCard(
                        product: pList[index],
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
    );
  }
}
