import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/const/app_colors.dart';
import '../customWidget/custom_text_field.dart';
import '../customWidget/login_custom_button.dart';

class ForgotPage extends StatelessWidget {
  ForgotPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              login_customButton(
                backgroundColor: AppColors.blockColor,
                title: 'Submit',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  } else {
                    print('Faild');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
