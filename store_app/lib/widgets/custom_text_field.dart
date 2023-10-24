// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:store_app/constants.dart';

class CustomTextField extends StatelessWidget {
  String labelText;
  Function(String)? onChanged;
  bool isObscure;
  String defaultValue;
  TextInputType inputType;
  final TextEditingController controller = TextEditingController();
  CustomTextField({
    Key? key,
    required this.labelText,
    this.onChanged,
    this.isObscure = false,
    required this.defaultValue,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.text = defaultValue;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: TextField(
        keyboardType: inputType,
        controller: controller,
        obscureText: isObscure,
        onChanged: onChanged,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: kAppBarWidgets,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: kAppBarWidgets,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: kAppBarWidgets,
            ),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: kAppBarWidgets,
          ),
          hintText: 'Enter Your $labelText',
          hintStyle: TextStyle(
            color: kAppBarWidgets,
          ),
        ),
      ),
    );
  }
}
