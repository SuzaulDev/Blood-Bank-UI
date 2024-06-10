import 'package:blood_bank_app/utils/helper_funtion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/drawer_bloc/drawer_bloc.dart';
import '../../bloc/drawer_bloc/drawer_state.dart';
import '../../bloc/home_business_logic/home_page_bloc.dart';
import '../../bloc/home_business_logic/home_page_event.dart';
import '../../utils/const/app_colors.dart';
import '../../utils/constant_value.dart';

Widget drawerScreen(double screenHeight,double screenWidth) {
  return Drawer(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
    child: Column(
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: AppColors.redColor,
          ),
          child: Center(
            child:
            BlocBuilder<DrawerBloc, DrawerState>(builder: (context, state) {
              if (state is DrawerSuccess) {
                return Text( state.UserTypeName != null ? state.UserTypeName : "General User",
                  style: TextStyle(color: Colors.white),
                );

              }
              return Container();
            }),
          ),
        ),
        BlocBuilder<DrawerBloc, DrawerState>(
          builder: (context, state) {
            if (state is DrawerSuccess) {
              return SizedBox(
                height: screenHeight - 200,
                child: ListView(
                  children: [
                    if (state.userTypeId == 0)
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: systemAdminMenu.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                context.read<HomePageBloc>().add(ShowDrawerMenuDetails(menuUrl: systemAdminMenu[index].menuUrl));
                                if (screenWidth < 600) {
                                  Navigator.pop(context);
                                }
                              },
                              title: Text(systemAdminMenu[index].name.toString()),
                              leading: Icon(
                                  iconsMap["${systemAdminMenu[index].icon}"]),
                            );
                          }),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.menuItemList.length,
                      itemBuilder: (context, index) => ListTile(
                        onTap: () {
                          context.read<HomePageBloc>().add(ShowDrawerMenuDetails(menuUrl: state.menuItemList[index].menuUrl));
                          if (screenWidth < 600) {
                            Navigator.pop(context);
                          }
                        },
                        title: Text(state.menuItemList[index].name.toString()),
                        leading:
                        Icon(iconsMap["${state.menuItemList[index].icon}"]),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: defaultMenu.length,
                      itemBuilder: (context, index) => ListTile(
                        onTap: () {
                          context.read<HomePageBloc>().add(ShowDrawerMenuDetails(menuUrl: defaultMenu[index].menuUrl));
                          if(screenWidth<600){
                            Navigator.pop(context);
                          }
                        },
                        title: Text(defaultMenu[index].name.toString()),
                        leading: Icon(iconsMap["${defaultMenu[index].icon}"]),
                      ),
                    ),
                    if(globalAuthToken != "null")ListTile(
                      onTap: () {
                       logOut();
                       Navigator.of(context).popAndPushNamed("/");
                        if(screenWidth<600){
                          Navigator.pop(context);
                        }
                      },
                      title: Text("Log Out"),
                      leading: Icon(Icons.logout_rounded,color: Colors.red,),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),

      ],
    ),
  );
}