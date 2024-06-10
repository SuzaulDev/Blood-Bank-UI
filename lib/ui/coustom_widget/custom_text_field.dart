import 'package:blood_bank_app/bloc/home_business_logic/home_page_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home_business_logic/home_page_event.dart';
import '../../utils/const/app_colors.dart';

Widget customTextField(
    {
      required TextInputType keyboardType,
      required validator,
      required TextEditingController controller,
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

Widget customSearchField ({required BuildContext context}){
  final controller = TextEditingController();
  return TextFormField(
    controller: controller,
    onFieldSubmitted: (value){
      context.read<HomePageBloc>().add(SearchFilter(value: controller.text));
    },
    decoration: InputDecoration(
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: IconButton(
          autofocus: true,
            onPressed: (){
              context.read<HomePageBloc>().add(SearchFilter(value: controller.text));
            },
            icon: Icon(Icons.search_outlined),
        ),
      ),
      hintText: 'Search..',
      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      fillColor: AppColors.whiteColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      filled: true,
    ),
  );
}