import 'package:blood_bank_app/ui/coustom_widget/custom_menu_text_field.dart';
import 'package:blood_bank_app/ui/coustom_widget/custom_menu_button.dart';
import 'package:blood_bank_app/ui/customView/custom_bottom_sheet.dart';
import 'package:blood_bank_app/ui/customView/custom_drop_down.dart';
import 'package:blood_bank_app/ui/customView/custom_text_field.dart';
import 'package:blood_bank_app/utils/constant_value.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../utils/const/app_colors.dart';

class MenuItemView extends StatefulWidget {
  const MenuItemView({super.key});

  @override
  State<MenuItemView> createState() => _MenuItemViewState();
}

class _MenuItemViewState extends State<MenuItemView> {
  String value = bloodGroupType[0];
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          showBottomSheet(
            context: context,
            builder: (context) {
              return CustomBottomSheet(
                isAction: true,
                titelText: "Menu Item",
              );
            },
          );
        },
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.whiteColor, AppColors.redColor]),
              borderRadius: BorderRadius.all(Radius.circular(23))),
          child: Center(
              child: Text(
            "Add new Menu",
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
}
