import 'package:flutter/material.dart';

import '../../../utils/const/app_colors.dart';

Widget applicationUserView(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.whiteColor,
                  AppColors.redColor
                ]),
            borderRadius:
            BorderRadius.all(Radius.circular(23))),
        child: Center(
            child: Text(
              "Add new",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            )),
      ),
    ),
  );
}