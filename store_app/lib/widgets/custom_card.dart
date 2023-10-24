// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:store_app/constants.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/screens/product_screen.dart';

class CustomCard extends StatefulWidget {
  Product product;
  CustomCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  Color iconColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductScreen.id,
          arguments: widget.product,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Card(
              //margin: EdgeInsets.all(10),
              shadowColor: kAppBarWidgets,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$ ${widget.product.price.toString()}'),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              iconColor == Colors.grey
                                  ? iconColor = Colors.redAccent
                                  : iconColor = Colors.grey;
                            });
                          },
                          child: Icon(
                            CupertinoIcons.heart_fill,
                            color: iconColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 40,
            bottom: 85,
            child: Image.network(
              widget.product.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
