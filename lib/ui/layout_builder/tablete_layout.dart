import 'package:blood_bank_app/ui/coustom_widget/drawer_screen.dart';
import 'package:blood_bank_app/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../coustom_widget/custom_layout_component.dart';
import '../customView/temp_data_view.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
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
          flex: 7,
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
          )
        )
      ],
    );;
  }
}
