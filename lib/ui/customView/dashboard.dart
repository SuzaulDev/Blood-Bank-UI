import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/const/app_colors.dart';
import '../pages/donar_registration_page.dart';

Widget dashBoard(List menuItemList) {
  return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: menuItemList.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.whiteColor, AppColors.redColor]),
                borderRadius: BorderRadius.all(Radius.circular(23))),
            child: Center(
                child: Text(
              menuItemList[index].toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            )),
          ),
        ),
      );
    },
  );
}
