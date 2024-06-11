import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import '../../utils/const/app_colors.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        onFinish: () {
          Navigator.pushReplacementNamed(context, '/homePage');
        },
        finishButtonText: 'Let\'s Begin',
        finishButtonStyle: const FinishButtonStyle(
          backgroundColor: AppColors.redColor,
        ),
        skipTextButton: const Text(
          'Skip',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.redColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        totalPage: 3,
        headerBackgroundColor: Colors.transparent,
        background: [
          Image.asset(
            'images/dr.jpg',
            height: 350,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/dr.jpg',
            height: 350,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/dr.jpg',
            height: 350,
            fit: BoxFit.cover,
          ),
        ],
        speed: 1.8,
        pageBodies: const [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 450,
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
                height: 20,
              ),
              Text(
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
                height: 450,
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
                height: 20,
              ),
              Text(
                'Dramatically unfeish Outing vortices\nbefore maintained pations.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 450,
              ),
              Text(
                'Donated 3',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Dramatically unfeish Outing vortices\nbefore maintained pations.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18,
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
