import 'package:blood_bank_app/ui/customView/supper_admin_menu_view/menu_item/menu_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import '../../../../data/models/menu_item_response_model.dart';
import '../../../../utils/const/app_colors.dart';

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
                    return const MenuItemBottomSheet(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(width: 2, color: Colors.white70),
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                  5: FlexColumnWidth(),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border:
                          Border.all(strokeAlign: 0.01, color: Colors.black),
                    ),
                    children: const [
                      Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "SI No",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                      Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Name",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                      Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Bangla Name",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                      Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Menu Type",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                      Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Url",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                      Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Action",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                    ],
                  ),
                  ...menuItemList.asMap().entries.map(
                    (student) {
                      return TableRow(
                          decoration: BoxDecoration(
                            border: Border.all(
                                strokeAlign: 0.01, color: Colors.black),
                          ),
                          children: [
                            Center(
                              child: Text(
                                student.value.id.toString(),
                              ),
                            ),
                            Center(
                              child: Text(
                                '${student.value.name}',
                              ),
                            ),
                            Center(
                              child: Text(
                                student.value.banglaName.toString(),
                              ),
                            ),
                            Center(
                              child: Text(
                                '${student.value.menuTypeName}',
                              ),
                            ),
                            Center(
                              child: Text(
                                student.value.url.toString(),
                              ),
                            ),
                            Center(
                              child: Wrap(
                                direction: Axis.horizontal,
                                spacing: 5,
                                runSpacing: 1,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.view_list),
                                    onPressed: (){},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.edit_outlined),
                                    onPressed: (){},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete,color: Colors.red,),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ]);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
