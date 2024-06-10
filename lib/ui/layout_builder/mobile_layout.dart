import 'package:blood_bank_app/ui/coustom_widget/custom_layout_component.dart';
import 'package:flutter/material.dart';
import '../coustom_widget/drawer_screen.dart';


class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(screenWidth),
      drawer: drawerScreen(screenHight,screenWidth),
      body: customBody(screenWidth),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}
