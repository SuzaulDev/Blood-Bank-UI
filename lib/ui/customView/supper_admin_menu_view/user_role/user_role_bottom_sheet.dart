import 'package:blood_bank_app/data/models/app_user_response_model.dart';
import 'package:blood_bank_app/data/models/menu_item_response_model.dart';
import 'package:blood_bank_app/data/models/user_role_assign_model.dart';
import 'package:blood_bank_app/ui/coustom_widget/custom_menu_text_field.dart';
import 'package:blood_bank_app/ui/coustom_widget/custom_user_role_model_drop_down.dart';
import 'package:blood_bank_app/utils/const/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/home_business_logic/home_page_bloc.dart';
import '../../../../bloc/home_business_logic/home_page_event.dart';
import '../../../../data/models/user_role_response_model.dart';
import '../../../coustom_widget/custom_menu_button.dart';
import '../../../coustom_widget/custom_drop_down.dart';

class RowState {
  MenuItemModel selectedMenu = MenuItemModel();
  bool canInsert = false;
  bool canUpdate = false;
  bool canDelete = false;
  bool canView = false;

  bool isView = false;
  bool isInsert = false;
  bool isUpdate = false;
  bool isDelete = false;
}



class UserRoleBottomSheet extends StatefulWidget {
  final List<MenuItemModel> menuItemList;
  final titelText;

  const UserRoleBottomSheet({
    super.key,
    required this.titelText,
    required this.menuItemList,
  });

  @override
  State<UserRoleBottomSheet> createState() => _UserRoleBottomSheet();
}

class _UserRoleBottomSheet extends State<UserRoleBottomSheet> {
  int addMore = 1;
  List<RowState> rowStates = [];
  String _selectedValueForMenuItem = "";

  final _userRoleNameController = TextEditingController();
  final _userRoleBanglaNameController = TextEditingController();
  @override
  void initState() {
    rowStates.add(RowState());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      
      builder: (context) {

        return Container(
          height: 400,
          child: ListView(
            children: [
              ListTile(
                title: Center(child: Text(widget.titelText)),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      CupertinoIcons.clear_circled_solid,
                      color: Colors.red,
                    )),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: customMenuInputField(
                          hintText: "English Name",
                          keyboardType: TextInputType.text,
                          controller: _userRoleNameController,
                          isRequired: true)),
                  Expanded(
                      child: customMenuInputField(
                          hintText: "Bangla Name",
                          keyboardType: TextInputType.text,
                          controller: _userRoleBanglaNameController,
                          isRequired: false)),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                        border: TableBorder.all(width: 2, color: Colors.white70),
                        columnWidths: const <int, TableColumnWidth>{
                          0: FlexColumnWidth(),
                          1: IntrinsicColumnWidth(),
                          2: IntrinsicColumnWidth(),
                          3: IntrinsicColumnWidth(),
                          4: IntrinsicColumnWidth(),
                          5: IntrinsicColumnWidth(),
                        },
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(
                            decoration: BoxDecoration(
                              color: AppColors.redColor,
                              border: Border.all(strokeAlign: 0.01, color: Colors.black),
                            ),
                            children: const [
                              Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Menu Item",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                              Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Insert",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                              Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Update",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                              Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                              Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "view",
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
                         for(int i = 0; i < addMore;i++)TableRow(
                              decoration: BoxDecoration(
                                border:
                                Border.all(strokeAlign: 0.01, color: Colors.black),
                              ),
                              children: [
                                Center(
                                  child: CustomDropdownMenu(
                                    dropDownList: widget.menuItemList,
                                    hintText: "Select Menu",
                                    isRequired: true,
                                    selectedValue: (selectedValue) {
                                        setState(() {
                                          _selectedValueForMenuItem = selectedValue;
                                          rowStates[i].selectedMenu = selectedMenu();
                                          rowStates[i].canView = selectedMenu().view!;
                                          rowStates[i].canInsert = selectedMenu().insert!;
                                          rowStates[i].canUpdate = selectedMenu().update!;
                                          rowStates[i].canDelete = selectedMenu().delete!;
                                          });
                                        },
                                  ),
                                ),
                               Center(
                                  child:  rowStates[i].canInsert ? Checkbox(
                                      value: rowStates[i].isInsert,
                                      onChanged: (newValue) {
                                        setState(() {
                                          rowStates[i].isInsert = newValue!;
                                        });
                                      }) : Container(),
                                ),
                                Center(
                                  child: rowStates[i].canUpdate ? Checkbox(
                                      value: rowStates[i].isUpdate,
                                      onChanged: (newValue) {
                                        setState(() {
                                          rowStates[i].isUpdate = newValue!;
                                        });
                                      }): Container(),
                                ),
                                Center(
                                  child: rowStates[i].canDelete? Checkbox(
                                      value: rowStates[i].isDelete,
                                      onChanged: (newValue) {
                                        setState(() {
                                          rowStates[i].isDelete = newValue!;
                                        });
                                      }): Container(),
                                ),
                                Center(
                                  child:rowStates[i].canView? Checkbox(
                                      value: rowStates[i].isView,
                                      onChanged: (newValue) {
                                        setState(() {
                                          rowStates[i].isView = newValue!;
                                        });
                                      }): Container(),
                                ),
                                Center(
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    spacing: 5,
                                    runSpacing: 1,
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            if(addMore < widget.menuItemList.length){
                                              addMore++;
                                              rowStates.add(RowState());
                                                }else{
                                              showDialog(context: context, builder: (context) => const Center(
                                                child: AlertDialog(
                                                  content: Text("You Can't ADD More"),
                                                ),
                                              ),);
                                            }
                                          });
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if(addMore > 1){
                                              addMore--;
                                              rowStates.remove(RowState());
                                            }else{
                                              showDialog(context: context, builder: (context) => const Center(
                                                child: AlertDialog(
                                                  content: Text("You Can't Delete Last Item"),
                                                ),
                                              ),);
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: customSaveButton(
                      icon: Icons.save,
                      titel: "SAVE",
                      btnColor: AppColors.redColor,
                      onClick: () {
                        //add event ...........
                          context.read<HomePageBloc>().add(AddNewUserRole(userRoleModel: _generateRequestModel() ));
                          //pop bottomsheet................
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }

  UserRoleModel _generateRequestModel() {
    UserRoleModel userRoleModel = UserRoleModel();
    UserRoleMaster master = UserRoleMaster();
    List<UserRoleDetailsList> listForSave = [];

    //for role assign master.......
    master.name = _userRoleNameController.text;
    master.banglaName = _userRoleBanglaNameController.text;

    // for role  details..........
    for(RowState row in rowStates){
      UserRoleDetailsList detailsList = UserRoleDetailsList();
      detailsList.menuItemId = row.selectedMenu.id;
      detailsList.menuItemName = row.selectedMenu.name;
      detailsList.insert = row.isInsert;
      detailsList.edit = row.isUpdate;
      detailsList.delete = row.isDelete;
      detailsList.view = row.isView;
      listForSave.add(detailsList);
    }

    userRoleModel.userRoleMaster = master;
    userRoleModel.userRoleDetailsList = listForSave;
    return userRoleModel;
  }

  MenuItemModel selectedMenu(){
    for(MenuItemModel menu in widget.menuItemList){
      if(int.parse(_selectedValueForMenuItem) == menu.id){
        return menu;
      }
    }
    return MenuItemModel();
  }


}


