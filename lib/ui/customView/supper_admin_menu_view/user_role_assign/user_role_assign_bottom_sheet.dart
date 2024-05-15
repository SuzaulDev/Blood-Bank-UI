import 'package:blood_bank_app/data/models/app_user_response_model.dart';
import 'package:blood_bank_app/data/models/user_role_assign_model.dart';
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

class UserRoleAssignBottomSheet extends StatefulWidget {
  final List<AppUserModel> appUserModel;
  final List<UserRoleModel> userRoleModel;
  final titelText;

  const UserRoleAssignBottomSheet({
    super.key,
    required this.titelText,
    required this.appUserModel,
    required this.userRoleModel,
  });

  @override
  State<UserRoleAssignBottomSheet> createState() => _UserRoleASsignBottomSheet();
}

class _UserRoleASsignBottomSheet extends State<UserRoleAssignBottomSheet> {
  String _selectedValueForAppUser = "";
  String _selectedValueForUserRole = "";
  final _appUserController = TextEditingController();
  final _userRoleController = TextEditingController();


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
                  icon: const Icon(
                    CupertinoIcons.clear_circled_solid,
                    color: Colors.red,
                  )),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: CustomDropdownMenu(
                    dropDownList: widget.appUserModel,
                    controller: _appUserController,
                    hintText: "App User",
                    isRequired: true,
                    selectedValue: (selectedValue){
                      _selectedValueForAppUser = selectedValue;
                    },
                  ),
                ),

              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: CustomUserRoleModelDropdownMenu(
                    dropDownList: widget.userRoleModel,
                    controller: _userRoleController,
                    hintText: "User Role",
                    isRequired: true,
                    selectedValue: (selectedValue){
                      _selectedValueForUserRole = selectedValue;
                    },
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
                      //add event ............
                      context.read<HomePageBloc>().add(SetUserRole(userRoleAssignModel: _generateRequestModel() ));

                      //pop bottomsheet................
                      Navigator.pop(context);
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

  UserRoleAssignModel _generateRequestModel() {

    UserRoleAssignModel userRoleAssign = UserRoleAssignModel();
    Master master = Master();
    DetailsList detailsList = DetailsList();
    List<DetailsList> listForSave = [];


    // for role assign master.......
    for(AppUserModel appUserModel in widget.appUserModel){
      if(int.parse(_selectedValueForAppUser) == appUserModel.id){
        master.appUserName = appUserModel.name;
        master.appUserId = appUserModel.id;
      }
    }
    // for role assign details..........

    for(UserRoleModel roleModel in widget.userRoleModel){
      if(int.parse(_selectedValueForUserRole) == roleModel.userRoleMaster!.id){
        detailsList.userRoleId = roleModel.userRoleMaster!.id;
        detailsList.userRoleName = roleModel.userRoleMaster!.name;
        listForSave.add(detailsList);
      }
    }

    userRoleAssign.master = master;
    userRoleAssign.detailsList = listForSave;
    return userRoleAssign;
  }
}

