import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customMenuInputField ({required  hintText,required TextInputType keyboardType,suffixIcon,required controller,required bool isRequired}){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      keyboardType: keyboardType,

      validator: (val){
        if(isRequired){
          if (val == null || val.isEmpty) {
            return 'This Field is Required';
          } else {
            return null;
          }
        }
      },
      controller: controller,
      decoration: InputDecoration(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(hintText),
              if(isRequired)Icon(CupertinoIcons.staroflife_fill,color: Colors.redAccent,size: 15,)
            ],
          ) ,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          hintText: hintText,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
      ),
    ),
  );
}