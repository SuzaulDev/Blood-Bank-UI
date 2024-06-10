import 'package:blood_bank_app/bloc/home_business_logic/home_page_bloc.dart';
import 'package:blood_bank_app/bloc/home_business_logic/home_page_event.dart';
import 'package:blood_bank_app/data/models/menu_item_response_model.dart';
import 'package:blood_bank_app/utils/const/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../coustom_widget/custom_menu_button.dart';
import '../../../coustom_widget/custom_menu_text_field.dart';


class MenuItemBottomSheet extends StatefulWidget {
  final bool isAction;
  final titelText;

  const MenuItemBottomSheet({
    super.key,
    required bool this.isAction,
    required this.titelText,
  });

  @override
  State<MenuItemBottomSheet> createState() => _MenuItemBottomSheetState();
}

class _MenuItemBottomSheetState extends State<MenuItemBottomSheet> {
  bool isView = false;
  bool isInsert = false;
  bool isUpdate = false;
  bool isDelete = false;

  final _menuIconNameController = TextEditingController();
  final _menuNameController = TextEditingController();
  final _menuBanglaNameController = TextEditingController();
  final _menuSerialNoController = TextEditingController();
  final _menuUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    hintText: "Name",
                    keyboardType: TextInputType.text,
                    controller: _menuNameController,
                    isRequired: true),
              ),
              Expanded(
                child: customMenuInputField(
                    hintText: "Bangla Name",
                    keyboardType: TextInputType.text,
                    controller: _menuBanglaNameController,
                    isRequired: true),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: customMenuInputField(
                    hintText: "Serial No",
                    keyboardType: TextInputType.text,
                    controller: _menuSerialNoController,
                    isRequired: true),
              ),
              Expanded(
                child: customMenuInputField(
                    hintText: "Icon Name",
                    keyboardType: TextInputType.text,
                    controller: _menuIconNameController,
                    isRequired:false ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: customMenuInputField(
                    hintText: "URL",
                    keyboardType: TextInputType.text,
                    controller: _menuUrlController,
                    isRequired: false),
              ),
            ],
          ),
          if (widget.isAction)
            Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("View"),
                    value: isView,
                    onChanged: (newValue) {
                      setState(() {
                        isView = newValue!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Insert"),
                    value: isInsert,
                    onChanged: (newValue) {
                      setState(() {
                        isInsert = newValue!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Update"),
                    value: isUpdate,
                    onChanged: (newValue) {
                      setState(() {
                        isUpdate = newValue!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Delete"),
                    value: isDelete,
                    onChanged: (value) {
                      setState(() {
                        isDelete = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
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
                    MenuItemModel menuItem = MenuItemModel();
                    menuItem.menuType = 2;
                    menuItem.menuTypeName = "MENU";
                    menuItem.name = _menuNameController.text;
                    menuItem.banglaName = _menuBanglaNameController.text;
                    menuItem.serialNo = int.parse(_menuSerialNoController.text);
                    menuItem.menuUrl = _menuUrlController.text;
                    menuItem.icon = _menuIconNameController.text;
                    menuItem.view = isView;
                    menuItem.insert = isInsert;
                    menuItem.update = isUpdate;
                    menuItem.delete = isDelete;

                    //add event ............
                    context
                        .read<HomePageBloc>()
                        .add(AddNewMenu(menuItem: menuItem));

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
}
