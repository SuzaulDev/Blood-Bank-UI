import 'package:blood_bank_app/data/models/menu_item_response_model.dart';
import 'package:blood_bank_app/data/models/password_policy_response_model.dart';
import 'package:blood_bank_app/data/models/app_user_response_model.dart';
import 'package:blood_bank_app/utils/const/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/home_business_logic/home_page_bloc.dart';
import '../../../../bloc/home_business_logic/home_page_event.dart';
import '../../../coustom_widget/custom_menu_button.dart';
import '../../../coustom_widget/custom_menu_text_field.dart';
import '../../../coustom_widget/custom_drop_down.dart';

class AppUserBottomSheet extends StatefulWidget {
  final List<PasswordPolicyModel> passwordPolicy;
  final titelText;

   const AppUserBottomSheet({
    super.key,
    required this.titelText,
    required this.passwordPolicy
  });

  @override
  State<AppUserBottomSheet> createState() => _MenuItemBottomSheetState();
}

class _MenuItemBottomSheetState extends State<AppUserBottomSheet> {
    bool isActive = true;
   String _selectedValue = "";

  final _passwordPolicyController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  dropDownList: widget.passwordPolicy,
                  controller: _passwordPolicyController,
                  hintText: "Password Policy",
                  isRequired: true,
                  selectedValue: (selectedValue){
                    _selectedValue = selectedValue;
                  },
                ),
              ),
              Expanded(
                child: customMenuInputField(
                    hintText: "Display Name",
                    keyboardType: TextInputType.text,
                    controller: _displayNameController,
                    isRequired: true),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: customMenuInputField(
                    hintText: "Phone Number",
                    keyboardType: TextInputType.text,
                    controller: _phoneNumberController,
                    isRequired: false),
              ),
              Expanded(
                child: customMenuInputField(
                    hintText: "Email",
                    keyboardType: TextInputType.text,
                    controller: _emailController,
                    isRequired: false),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: customMenuInputField(
                    hintText: "User Name",
                    keyboardType: TextInputType.text,
                    controller: _userNameController,
                    isRequired: true),
              ),
              Expanded(
                child: customMenuInputField(
                    hintText: "Password",
                    keyboardType: TextInputType.text,
                    controller: _passwordController,
                    isRequired: true),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Active"),
                  value: isActive,
                  onChanged: (newValue) {
                    setState(() {
                      isActive = newValue!;
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
                    AppUserModel appUserModel = AppUserModel();
                    appUserModel.passwordPolicyId = int.parse(_selectedValue);
                    appUserModel.displayName = _displayNameController.text;
                    appUserModel.mobile = _phoneNumberController.text;
                    appUserModel.email = _emailController.text;
                    appUserModel.username = _userNameController.text;
                    appUserModel.password = _passwordController.text;
                    appUserModel.active = isActive;
                    appUserModel.userTypeName = "ADMIN";

                    //add event ............
                    context.read<HomePageBloc>().add(AddNewUser(appUserModel:appUserModel));

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
