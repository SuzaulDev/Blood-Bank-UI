import 'package:blood_bank_app/bloc/login_bloc/login_page_bloc.dart';
import 'package:blood_bank_app/bloc/login_bloc/login_page_event.dart';
import 'package:blood_bank_app/bloc/login_bloc/login_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/const/app_colors.dart';
import '../coustom_widget/login_custom_button.dart';

import 'forgot_page.dart';
import 'home_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: ListView(
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
                TextFormField(
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
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Text('Password'),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
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
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ForgotPage()));
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: AppColors.grayColor),
                  ),
                ),
                BlocListener<LoginPageBloc,LoginPageState>(
                  listener: (context, state) {
                    if(state is LoginSuccess){

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false,
                      );
                    }
                  },
                  child: login_customButton(
                    backgroundColor: AppColors.redColor,
                    title: 'Log In',
                    onPressed: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => HomePage()));
                      if (_formKey.currentState!.validate()) {
                        //todo: call login event
                        final username = _emailController.text;
                        final password = _passwordController.text;
                        context.read<LoginPageBloc>().add(LoginOnClick(
                            username: username, password: password));
                      } else {
                        print('Faild');
                      }
                    },
                  ),
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
    );
  }
}
