import 'package:blood_bank_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../const/app_colors.dart';
import '../customWidget/custom_text_field.dart';
import '../customWidget/login_custom_button.dart';
import 'forgot_page.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Log In',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  login_customButton(
                      imageUrl: "images/google.png",
                      backgroundColor: AppColors.redColor,
                      title: 'Log In with Goggle',
                      onPressed: () {}),
                  SizedBox(
                    height: 10.h,
                  ),
                  login_customButton(
                    imageUrl: 'images/facebook.png',
                    backgroundColor: AppColors.redColor,
                    title: 'Log In with Facebook',
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  login_customButton(
                      imageUrl: 'images/twitter.png',
                      backgroundColor: AppColors.redColor,
                      title: 'Log In with Twitter',
                      onPressed: () {}),
                  SizedBox(
                    height: 20.h,
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
                  SizedBox(
                    height: 10.h,
                  ),
                  const Text('Email'),
                  SizedBox(
                    height: 10.h,
                  ),
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
                    height: 10.h,
                  ),
                  const Text('Password'),
                  SizedBox(
                    height: 10.h,
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
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPage()));
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: AppColors.grayColor),
                    ),
                  ),
                  login_customButton(
                    backgroundColor: AppColors.redColor,
                    title: 'Log In',
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                      // if (_formKey.currentState!.validate()) {
                      //
                      // } else {
                      //   print('Faild');
                      // }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => RegisterPage()));
                            Navigator.pushNamed(context, '/registerPage');
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(color: AppColors.blockColor),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
