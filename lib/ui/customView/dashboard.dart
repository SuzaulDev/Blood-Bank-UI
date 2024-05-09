import 'package:blood_bank_app/data/models/menu_item_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/const/app_colors.dart';

Widget webDashBoard(List<MenuItemModel> menuItemList){
  return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: menuItemList.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.whiteColor, AppColors.redColor]),
                borderRadius: BorderRadius.all(Radius.circular(23))),
            child: Center(
                child: Text(
                  menuItemList[index].name.toString(),
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
