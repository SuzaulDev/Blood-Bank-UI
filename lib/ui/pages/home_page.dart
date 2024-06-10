import 'package:blood_bank_app/bloc/drawer_bloc/drawer_bloc.dart';
import 'package:blood_bank_app/bloc/drawer_bloc/drawer_event.dart';
import 'package:blood_bank_app/ui/layout_builder/mobile_layout.dart';
import 'package:blood_bank_app/ui/layout_builder/tablete_layout.dart';
import 'package:blood_bank_app/ui/layout_builder/web_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home_business_logic/home_page_bloc.dart';
import '../../bloc/home_business_logic/home_page_event.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomePageBloc>().add(LoadHomePage());
    context.read<DrawerBloc>().add(LoadDrawer());
    final screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    return LayoutBuilder(builder: (context, constraints) {
      if (screenWidth < 600) {
        return MobileLayout();
      } else if (screenWidth > 600 && screenWidth < 1024) {
        return TabletLayout();
      } else {
        return WebLayout();
      }
    });
  }
}



