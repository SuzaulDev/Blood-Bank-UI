import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/const/app_colors.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        onFinish: () {
          Navigator.pushNamed(context, '/loginPage');
        },
        finishButtonText: 'Let\'s Begin',
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: AppColors.redColor,
        ),
        skipTextButton: Text(
          'Skip',
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.redColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        totalPage: 3,
        headerBackgroundColor: Colors.transparent,
        background: [
          Image.asset(
            'images/dr.jpg',
            height: 350.h,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/dr.jpg',
            height: 350.h,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/dr.jpg',
            height: 350.h,
            fit: BoxFit.cover,
          ),
        ],
        speed: 1.8,
        pageBodies: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 450.h,
              ),
              Text(
                'Donated 1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Text(
                'Dramatically unfeish Outing vortices\nbefore maintained pations.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.blockColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 450.h,
              ),
              Text(
                'Donated 2',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Dramatically unfeish Outing vortices\nbefore maintained pations.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 450.h,
              ),
              Text(
                'Donated 3',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Dramatically unfeish Outing vortices\nbefore maintained pations.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
