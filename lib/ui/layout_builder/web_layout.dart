import 'package:blood_bank_app/ui/coustom_widget/custom_layout_component.dart';
import 'package:blood_bank_app/ui/coustom_widget/drawer_screen.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class WebLayout extends StatelessWidget {
  const WebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Container(
                height: screenHeight,
                child: drawerScreen(screenHeight,screenWidth),
              )
            ],
          ),
        ),
        Expanded(
          flex: 8,
          child: Column(
            children: [
              SizedBox(
                height: screenHeight,
                width: screenWidth,
                child: Scaffold(
                  appBar: customAppBar(screenWidth),
                  body: customBody(screenWidth),
                  bottomNavigationBar: const CustomBottomNavigation(),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
