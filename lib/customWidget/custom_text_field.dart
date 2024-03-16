import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customTextField(
    {
      required keyboardType,
      required validator,
      required controller,
      required hintText,
      suffixIcon,
      bool obscureText = false,
    }) {
  return TextFormField(
    keyboardType: keyboardType,
    validator: validator,
    controller: controller,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        )),
  );
}
