import 'package:blood_bank_app/bloc/home_business_logic/home_page_bloc.dart';
import 'package:blood_bank_app/bloc/home_business_logic/home_page_state.dart';
import 'package:blood_bank_app/bloc/my_profile_bloc/my_profile_bloc.dart';
import 'package:blood_bank_app/bloc/my_profile_bloc/my_profile_state.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../utils/const/app_colors.dart';
import '../coustom_widget/custom_button.dart';

import 'home_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileNoController = TextEditingController();
  TextEditingController _deathofbithController = TextEditingController();
  final formKeys = GlobalKey<FormState>();
  bool isPhoneValidated = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        automaticallyImplyLeading: screenWidth > 600 ? false : true,
        iconTheme: IconThemeData(color: Colors.white),
        title: BlocBuilder<MyProfileBloc,MyProfileState>(
          builder: (context, state) {
            if(state is MyProfileSuccess){
              return Text( state.appUserModel.displayName!,
                style: const TextStyle(color: AppColors.whiteColor, fontSize: 20,fontWeight: FontWeight.bold),
              );
            }
            else{
              return const Text("My Profile",style: TextStyle(color: AppColors.whiteColor, fontSize: 20));
            }
          },
        ),
        centerTitle: true,
        flexibleSpace: ClipPath(
          clipBehavior: Clip.none,
          clipper: OvalBottomBorderClipper(),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                color: AppColors.redColor,
              ),
              Positioned(
                bottom: -50,
                child: Container(
                  height: 80,
                  width: 80,
                  //color: Colors.black,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('images/person.jpg'),
                      ),
                      Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(50)),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.camera_alt_rounded,
                                color: AppColors.redColor,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 15, right: 15),
          child: BlocBuilder<MyProfileBloc,MyProfileState>(builder: (context, state) {
            if(state is MyProfileSuccess){
              _nameController.text = state.appUserModel.displayName != null ? state.appUserModel.displayName! : "";
              _emailController.text = state.appUserModel.username!= null ?  state.appUserModel.username!: "";
              _mobileNoController.text = state.appUserModel.mobile != null ? state.appUserModel.mobile! : "";

             return Form(
                autovalidateMode: AutovalidateMode.always,
                key: formKeys,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name'),
                    SizedBox(
                      height: 10,
                    ),
                    customTextFromField(
                      hintText: 'Enter Your Name',
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter the name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Email'),
                    SizedBox(
                      height: 10,
                    ),
                    customTextFromField(
                      hintText: 'Enter Your Email',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter the email';
                        } else if (!val!.contains(RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+"))) {
                          return 'enter a valid email address';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Mobile'),
                    SizedBox(
                      height: 10,
                    ),
                    IntlPhoneField(
                      initialCountryCode: "BD",
                      controller: _mobileNoController,
                      decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 9, horizontal: 10),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Text('Dete of Birth'),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // DateTimePicker(
                    //   decoration: InputDecoration(
                    //       contentPadding:
                    //       EdgeInsets.symmetric(vertical: 9, horizontal: 10),
                    //       border: OutlineInputBorder()),
                    //   // initialValue: DateTime.now().toString(),
                    //   firstDate: DateTime(2000),
                    //   lastDate: DateTime(2100),
                    //   dateLabelText: 'Date',
                    //   //onChanged: (val) => print(val),
                    //   validator: (val) {
                    //     if (val == null || val.isEmpty) {
                    //       return "Enter the Date of Birth";
                    //     }
                    //
                    //     return null;
                    //   },
                    //   // onSaved: (val) => print(val),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    //
                    // customButton(
                    //     isCornerRadius: true,
                    //     onPressed: () {
                    //       if (formKeys.currentState!.validate()) {
                    //         print('Success');
                    //       } else {
                    //         print('failed');
                    //       }
                    //     },
                    //     text: 'Next'),
                  ],
                ),
              );
            }
            if(state is MyProfileError){
              return Center();
            }
            else{
              return Center();
            }
          },)
        ),
      ),
    );
  }
}

Widget customTextFromField({
  required String hintText,
  required controller,
  required keyboardType,
  required validator,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    validator: validator,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 10),
        hintText: hintText,
        border: OutlineInputBorder()),
  );
}
