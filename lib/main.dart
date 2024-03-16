import 'package:blood_bank_app/pages/blood_group.dart';
import 'package:blood_bank_app/pages/blood_type.dart';
import 'package:blood_bank_app/pages/forgot_page.dart';
import 'package:blood_bank_app/pages/login_page.dart';
import 'package:blood_bank_app/pages/onboarding.dart';
import 'package:blood_bank_app/pages/home_page.dart';
import 'package:blood_bank_app/pages/profile_page.dart';
import 'package:blood_bank_app/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          initialRoute: '/',
          routes: {
            '/loginPage': (context) => LogInPage(),
            '/registerPage': (context) => RegisterPage(),
            '/forgotPage': (context) => ForgotPage(),
            '/profilePage': (context) => ProfilePage(),
            '/bloodType': (context) => BloodType(),
            '/bloodGroup': (context) => BloodGroup(),
          },
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: Onboarding(),
        );
      },
    );
  }
}
