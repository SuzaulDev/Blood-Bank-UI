import 'package:blood_bank_app/ui/customView/custom_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../data/models/menu_item_response_model.dart';
import '../../../utils/const/app_colors.dart';

class MenuItemView extends StatelessWidget {
  final List<MenuItemModel> menuItemList;

  const MenuItemView({super.key, required this.menuItemList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return const CustomBottomSheet(
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
                child: const Center(
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
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: menuItemList.length,
              itemBuilder: (context, index) => ListTile(
                leading: Text(menuItemList[index].id.toString()),
                title: Text(menuItemList[index].name.toString()),
                trailing: Checkbox(
                    value: menuItemList[index].insert, onChanged: (v) {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
