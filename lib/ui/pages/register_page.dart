import 'package:blood_bank_app/bloc/register_bloc/register_page_bloc.dart';
import 'package:blood_bank_app/bloc/register_bloc/register_page_event.dart';
import 'package:blood_bank_app/bloc/register_bloc/register_page_state.dart';
import 'package:blood_bank_app/data/models/register_request_model.dart';
import 'package:blood_bank_app/ui/coustom_widget/alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/const/app_colors.dart';
import '../coustom_widget/custom_text_field.dart';
import '../coustom_widget/login_custom_button.dart';

import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isChecked = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.redColor,
        centerTitle: true,
        title: Text(
          'Register',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              //autovalidateMode: AutovalidateMode.always,
              child: Center(
                child: SizedBox(
                  width: screenWidth > 600 ? screenWidth / 2 : double
                      .infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      login_customButton(
                          imageUrl: 'images/google.png',
                          backgroundColor: AppColors.redColor,
                          title: 'Log In with Goggle',
                          onPressed: () {}),
                      SizedBox(
                        height: 10,
                      ),
                      login_customButton(
                          imageUrl: 'images/facebook.png',
                          backgroundColor: AppColors.redColor,
                          title: 'Log In with Facebook',
                          onPressed: () {}),
                      SizedBox(
                        height: 10,
                      ),
                      login_customButton(
                          imageUrl: 'images/twitter.png',
                          backgroundColor: AppColors.redColor,
                          title: 'Log In with Twitter',
                          onPressed: () {}),
                      SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          Text('     Or Log In with email      '),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      Text('Name'),
                      SizedBox(
                        height: 10,
                      ),
                      //customTextField('Enter your name'),
                      customTextField(
                        hintText: 'Enter your name',
                        keyboardType: TextInputType.name,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter the name';
                          } else {
                            return null;
                          }
                        },
                        controller: _nameController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text('Email'),
                      SizedBox(
                        height: 10,
                      ),
                      //customTextField('Enter your email'),
                      customTextField(
                        hintText: 'Enter your email',
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
                        controller: _emailController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text('Password'),
                      SizedBox(
                        height: 10,
                      ),

                      customTextField(
                          hintText: 'Enter your password',
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter the password';
                            } else if (val.contains(RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>'))) {
                              return 'enter a valid password';
                            } else {
                              return null;
                            }
                          },
                          controller: _passwordController,
                          suffixIcon: Icon(Icons.remove_red_eye_outlined)),
                      Row(
                        children: [
                          Checkbox(
                              value: isChecked,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  isChecked = newValue!;
                                });
                              }),
                          const Expanded(
                              child: Text(
                            'I accept and agree to comply with Verbivy\'s Terms and Condition and Privacy policy',
                            style: TextStyle(fontSize: 12),
                          ))
                        ],
                      ),
                      BlocListener<RegisterPageBloc,RegisterPageState>(
                        listener: (context, state) {

                          if (state is RegisterSuccess && state.logInResponseModel.status!) {
                            Navigator.of(context).popAndPushNamed("/");
                            showLoginSuccessDialog(context);
                          }
                          if(state is RegisterSuccess && !state.logInResponseModel.status!){
                            showLoginFailedDialog(context: context,msg: state.logInResponseModel.message!);
                          }
                          if(state is RegisterPageError){
                            print(state.error.toString());
                          }
                      },
                        child:login_customButton(
                          backgroundColor: AppColors.redColor,
                          title: 'Register',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final displayName = _nameController.text;
                              final username = _emailController.text;
                              final password = _passwordController.text;
                              RegisterRequestModel rm = RegisterRequestModel(displayName: displayName, username: username, password: password);
                              context.read<RegisterPageBloc>().add(RegisterOnClick(registerRequestModel: rm));
                            } else {
                              print('Faild');
                            }
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Have an account?'),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/loginPage');
                              },
                              child: const Text(
                                'LogIn',
                                style: TextStyle(color: AppColors.blockColor),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
