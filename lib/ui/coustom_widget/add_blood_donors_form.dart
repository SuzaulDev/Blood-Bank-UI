import 'package:blood_bank_app/data/models/blood_donor_response_model.dart';
import 'package:blood_bank_app/data/models/password_policy_response_model.dart';
import 'package:blood_bank_app/data/models/app_user_response_model.dart';
import 'package:blood_bank_app/ui/coustom_widget/custom_date_picker.dart';
import 'package:blood_bank_app/utils/const/app_colors.dart';
import 'package:blood_bank_app/utils/constant_value.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home_business_logic/home_page_bloc.dart';
import '../../bloc/home_business_logic/home_page_event.dart';
import 'custom_drop_down.dart';
import 'custom_menu_button.dart';
import 'custom_menu_text_field.dart';


class AddDonorForm extends StatefulWidget {
  final List<PasswordPolicyModel> passwordPolicy;
  final titelText;

  const AddDonorForm({
    super.key,
    required this.titelText,
    required this.passwordPolicy
  });

  @override
  _AddDonorFormState createState() => _AddDonorFormState();
}

class _AddDonorFormState extends State<AddDonorForm> {
  bool isActive = true;
  String _selectedValueForPasswordPolicy = "";
  String _selectedValueForBloodGroup = "";

  final _passwordPolicyController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _bloodGroupController = TextEditingController();
  final _cityController = TextEditingController();
  final _lastDonationController = TextEditingController();
  final _dobController = TextEditingController();
  final _professionController = TextEditingController();

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
                  dropDownList:widget.passwordPolicy,
                  controller: _passwordPolicyController,
                  hintText: "Password Policy",
                  isRequired: true,
                  selectedValue: (selectedValue){
                    _selectedValueForPasswordPolicy = selectedValue;
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
                    isRequired: true),
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
                child:  CustomDropdownMenu(
                  dropDownList: bloodGroupTypeList,
                  controller: _bloodGroupController,
                  hintText: "Blood Group",
                  isRequired: true,
                  selectedValue: (selectedValue){
                    _selectedValueForBloodGroup = selectedValue;
                  },
                ),
              ),
              Expanded(
                child: customMenuInputField(
                    suffixIcon: Icon(CupertinoIcons.location_solid),
                    hintText: "City",
                    keyboardType: TextInputType.text,
                    controller: _cityController,
                    isRequired: true),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: customDatePicker(
                  suffixIcon: Icon(Icons.date_range_rounded),
                  isRequired: true,
                  label: "Last Donation",
                  firstDate: DateTime(1900,1,1),
                  dateController: _lastDonationController,
                  context: context,
                )
              ),
              Expanded(
                child: customDatePicker(
                  suffixIcon: Icon(Icons.date_range_rounded),
                  isRequired: true,
                  label: "Date Of Birth",
                  firstDate: DateTime(1900,1,1),
                  context: context,
                  dateController: _dobController
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: customMenuInputField(
                    hintText: "Profession",
                    keyboardType: TextInputType.text,
                    controller: _professionController,
                    isRequired: false),
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
                    AppUserDto appUserDto = AppUserDto();
                    DonorInfoDto donorInfoDto = DonorInfoDto();
                    DonorInfoModel donorInfoModel = DonorInfoModel();


                    appUserDto.passwordPolicyId = int.parse(_selectedValueForPasswordPolicy);
                    for(PasswordPolicyModel model in widget.passwordPolicy){
                      if(model.id == int.parse(_selectedValueForPasswordPolicy)){
                        appUserDto.passwordPolicyName = model.name;
                      }
                    }
                    for(BloodGroup model in bloodGroupTypeList){
                      if(model.id == int.parse(_selectedValueForBloodGroup)){
                        donorInfoDto.bloodGroup = model.name;
                      }
                    }

                    appUserDto.displayName = _displayNameController.text;
                    appUserDto.name = _displayNameController.text;
                    appUserDto.email = _emailController.text;
                    appUserDto.mobile = _phoneNumberController.text;
                    appUserDto.username = _userNameController.text;
                    appUserDto.password = _passwordController.text;
                    appUserDto.active = isActive;
                    appUserDto.userTypeId = 1;
                    appUserDto.userTypeName = "DONOR";

                    donorInfoDto.city = _cityController.text;
                    donorInfoDto.dateOfBirth = _dobController.text;
                    donorInfoDto.lastDonation = _lastDonationController.text;
                    donorInfoDto.occupation = _professionController.text;

                    donorInfoModel.appUserDto = appUserDto;
                    donorInfoModel.donorInfoDto = donorInfoDto;

                    print(donorInfoModel.toJson());


                    //add event ............
                    context.read<HomePageBloc>().add(AddNewDonor(donorInfoModel:donorInfoModel));

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
