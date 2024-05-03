import 'package:blood_bank_app/utils/const/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/constant_value.dart';
import '../coustom_widget/custom_menu_button.dart';
import '../coustom_widget/custom_menu_text_field.dart';
import 'custom_drop_down.dart';

class CustomBottomSheet extends StatefulWidget {
  final bool isAction;
  final titelText;
   const CustomBottomSheet({
    super.key,
    required bool this.isAction,
    required this.titelText,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  bool isView = false;
  bool isInsert = false;
  bool isUpdate = false;
  bool isDelete = false;

  final _menuTypeController = TextEditingController();
  final _menuNameController = TextEditingController();
  final _menuBanglaNameController = TextEditingController();
  final _menuSerialNoController = TextEditingController();
  final _menuUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Container(
        height: 400,
        child: ListView(
          children: [
            ListTile(
              title: Center(child: Text(widget.titelText)),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    CupertinoIcons.clear_circled_solid,
                    color: Colors.red,
                  )),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: CustomDropdownMenu(
                    dropDownList: bloodGroupType,
                    controller: _menuTypeController,
                    hintText: "Menu Type",
                    isRequired: true,
                  ),
                ),
                Expanded(
                  child: customMenuInputField(
                      hintText: "Name",
                      keyboardType: TextInputType.text,
                      controller: _menuNameController,
                      isRequired: true),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: customMenuInputField(
                      hintText: "Bangla Name",
                      keyboardType: TextInputType.text,
                      controller: _menuBanglaNameController,
                      isRequired: true),
                ),
                Expanded(
                  child: customMenuInputField(
                      hintText: "Serial No",
                      keyboardType: TextInputType.text,
                      controller:_menuSerialNoController,
                      isRequired: true),
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
                      onChanged: (newValue){
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
                      onChanged: (newValue){
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
                      onChanged:(newValue){
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
                      onChanged: (value){
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
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: customMenuButton(
                    icon: Icons.save,
                    titel: "SAVE",
                    btnColor: AppColors.redColor,
                    onClick: (){
                      print('ok');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
