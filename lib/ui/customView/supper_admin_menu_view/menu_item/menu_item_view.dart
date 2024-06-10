import 'package:blood_bank_app/bloc/home_business_logic/home_page_bloc.dart';
import 'package:blood_bank_app/bloc/home_business_logic/home_page_event.dart';
import 'package:blood_bank_app/ui/customView/supper_admin_menu_view/menu_item/menu_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/menu_item_response_model.dart';
import '../../../../utils/const/app_colors.dart';

class MenuItemView extends StatelessWidget {
  final List<MenuItemModel> menuItemList;

  const MenuItemView({super.key, required this.menuItemList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: menuItemList.isNotEmpty ? Table(
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
                        color: AppColors.redColor,
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
                                  student.value.menuUrl.toString(),
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
                                      onPressed: () {
                                        context.read<HomePageBloc>().add(DeleteMenu(menuItem:student.value));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ]);
                      },
                    ) ,
                  ],
                ) : Text("No Data"),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.redColor,
        elevation: 10,
        tooltip: "Add New Menu",
          onPressed: (){
            showModalBottomSheet(
              barrierColor: Colors.transparent,
              isDismissible: false,
              showDragHandle: true,
              enableDrag: true,
              backgroundColor: Colors.white,
              context: context,
              builder: (context) {
                return const MenuItemBottomSheet(
                  isAction: true,
                  titelText: "Menu Item",
                );
              },
            );
          },
          label: const Row(
            children: [
              Icon(Icons.add,color: Colors.white,),
              Text("Add New",style: TextStyle(color: Colors.white),),
            ],
          ),
      ),
    );
  }
}
