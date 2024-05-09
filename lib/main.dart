import 'package:blood_bank_app/bloc/drawer_bloc/drawer_bloc.dart';
import 'package:blood_bank_app/bloc/login_bloc/login_page_bloc.dart';
import 'package:blood_bank_app/bloc/register_bloc/register_page_bloc.dart';
import 'package:blood_bank_app/ui/pages/blood_group.dart';
import 'package:blood_bank_app/ui/pages/blood_type.dart';
import 'package:blood_bank_app/ui/pages/forgot_page.dart';
import 'package:blood_bank_app/ui/pages/home_page.dart';
import 'package:blood_bank_app/ui/pages/login_page.dart';
import 'package:blood_bank_app/ui/pages/profile_page.dart';
import 'package:blood_bank_app/ui/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/home_business_logic/home_page_bloc.dart';
import 'data/services/api_service.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomePageBloc(ApiService())),
          BlocProvider(create: (context) => LoginPageBloc(apiService: ApiService()),),
          BlocProvider(create: (context) => RegisterPageBloc(apiService: ApiService()),),
          BlocProvider(create: (context) => DrawerBloc(),)
        ],
        child: MaterialApp(
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
          home: HomePage(),
        ));
  }
}
