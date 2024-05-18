import 'package:blood_bank_app/bloc/drawer_bloc/drawer_bloc.dart';
import 'package:blood_bank_app/bloc/drawer_bloc/drawer_event.dart';
import 'package:blood_bank_app/bloc/drawer_bloc/drawer_state.dart';
import 'package:blood_bank_app/ui/customView/supper_admin_menu_view/app_user/application_user_view.dart';
import 'package:blood_bank_app/ui/customView/supper_admin_menu_view/menu_item/menu_item_view.dart';
import 'package:blood_bank_app/ui/customView/supper_admin_menu_view/password_policy/password_policy.dart';
import 'package:blood_bank_app/ui/customView/supper_admin_menu_view/user_role/user_role_view.dart';
import 'package:blood_bank_app/ui/customView/supper_admin_menu_view/user_role_assign/user_role_asign_view.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home_business_logic/home_page_bloc.dart';
import '../../bloc/home_business_logic/home_page_event.dart';
import '../../bloc/home_business_logic/home_page_state.dart';
import '../../utils/const/app_colors.dart';
import '../../utils/constant_value.dart';
import '../../utils/constant_value.dart';
import '../../utils/constant_value.dart';
import '../../utils/constant_value.dart';
import '../customView/dashboard.dart';
import '../customView/temp_data_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String authToken = "";

  @override
  void initState() {
    context.read<HomePageBloc>().add(LoadHomePage());
    context.read<DrawerBloc>().add(LoadDrawer());
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return WillPopScope(
        onWillPop: () async {
          // Show a dialog to confirm exit.
          bool exit = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Exit app?'),
              content: Text('Are you sure you want to exit the app?'),
              actions: <Widget>[
                MaterialButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No'),
                ),
                MaterialButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('Yes'),
                ),
              ],
            ),
          );
          // Return true if the user confirms exit, false otherwise.
          return exit ?? false;
        },
        child: LayoutBuilder(
          builder: (context, constraints) => Scaffold(
            drawer: constraints.maxWidth > 600 ? null : drawerView(constraints),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: AppColors.redColor,
              centerTitle: true,
              title: const Text(
                'Home',
                style: TextStyle(
                    color: AppColors.whiteColor, fontWeight: FontWeight.bold),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: BlocBuilder<HomePageBloc, HomePageState>(
                    builder: (context, state) {
                      if (authToken != "" && authToken != "null") {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/profilePage");
                          },
                          child: const CircleAvatar(
                            backgroundImage: AssetImage("images/person.jpg"),
                          ),
                        );
                      } else {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/loginPage");
                          },
                          child: const CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
              bottom: constraints.maxWidth > 600
                  ? null
                  : PreferredSize(
                      preferredSize: Size.fromHeight(65),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search_outlined),
                            hintText: 'Search..',
                            contentPadding: EdgeInsets.symmetric(vertical: 15),
                            fillColor: AppColors.whiteColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                          ),
                        ),
                      ),
                    ),
            ),
            body: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (constraints.maxWidth > 600)
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: hight - 120,
                          width: double.infinity,
                          child: drawerView(constraints),
                        )
                      ],
                    ),
                  ),
                Expanded(
                  flex: 7,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (getUserTypeId() == 3)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              bloodName(
                                title: 'A+',
                                colors: Color(0xffff0040),
                                textColors: Color(0xffffffff),
                              ),
                              bloodName(
                                title: 'A-',
                                colors: Color(0xffff0040),
                                textColors: Color(0xffffffff),
                              ),
                              bloodName(
                                title: 'B+',
                                colors: Color(0xffff0040),
                                textColors: Color(0xffffffff),
                              ),
                              bloodName(
                                title: 'B-',
                                colors: Color(0xffff0040),
                                textColors: Color(0xffffffff),
                              ),
                              bloodName(
                                title: 'O+',
                                colors: Color(0xffff0040),
                                textColors: Color(0xffffffff),
                              ),
                              bloodName(
                                title: 'O-',
                                colors: Color(0xffff0040),
                                textColors: Color(0xffffffff),
                              ),
                              bloodName(
                                title: 'AB+',
                                colors: Color(0xffff0040),
                                textColors: Color(0xffffffff),
                              ),
                              bloodName(
                                title: 'AB-',
                                colors: Color(0xffff0040),
                                textColors: Color(0xffffffff),
                              ),
                            ],
                          ),
                        if (getUserTypeId() == 3)
                          const SizedBox(
                            height: 10,
                          ),
                        BlocBuilder<HomePageBloc, HomePageState>(
                          builder: (context, state) {
                            if (state is HomePageLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state is HomePageLoaded) {
                              //TODO: return dashbordview or user list into the condition bloc
                              if (state.userTypeId == 3) {
                                return webDashBoard(
                                    state.menuItemResponse.data!);
                              }
                              return dataView(context, state.userModelList);
                            }
                            if (state is ApplicationUser) {
                              return ApplicationUserView(
                                appUserList: state.appUserResponse.data!,
                                passwordPolicyList:
                                    state.passwordPolicyResponse.data!,
                              );
                            }
                            if (state is UserRole) {
                              return UserRoleView(
                                userRoleList: state.responseModel.data!,
                                menuItemList: state.menuItemResponseModel.data!,
                              );
                            }
                            if (state is UserRoleAssign) {
                              return UserRoleAssignView(
                                userRoleAssignList:
                                    state.userRoleAssignResponseModel.data!,
                                appUserModelList:
                                    state.appUserResponseModel.data!,
                                userRoleModelList:
                                    state.userRoleResponseModel.data!,
                              );
                            }
                            if (state is PasswordPolicy) {
                              //print(state.passwordPolicyList[0].);
                              return PasswordPolicyView(
                                  passwordPolicyList:
                                      state.passwordPolicyResponse.data!);
                            }
                            if (state is MenuItem) {
                              return MenuItemView(
                                  menuItemList: state.menuItemResponse.data!);
                            }
                            if (state is HomePageError) {
                              return Center(
                                child: Text(state.errorMessage),
                              );
                            } else {
                              return Container(); // Placeholder for other states if needed
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: AppColors.redColor,
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.white,
                items: const [
                  BottomNavigationBarItem(
                      label: "Home", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "Feed", icon: Icon(Icons.feed)),
                  BottomNavigationBarItem(
                      label: "Account", icon: Icon(Icons.person)),
                ]),
          ),
        ));
  }

  void getToken() async {
    authToken = await getAuthToken();
  }
}

Widget bloodName({
  required String title,
  required colors,
  required textColors,
}) {
  return Container(
    height: 35,
    width: 35,
    decoration:
        BoxDecoration(color: colors!, borderRadius: BorderRadius.circular(5)),
    child: Center(
        child: Text(
      title,
      style: TextStyle(color: textColors),
    )),
  );
}

Widget drawerView(BoxConstraints constraints) {
  return Drawer(
    width: 250,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
    child: ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: AppColors.redColor,
          ),
          child: Center(
            child:
                BlocBuilder<DrawerBloc, DrawerState>(builder: (context, state) {
              if (state is DrawerSuccess) {
                if (state.userIdType == 3) {
                  return const Text(
                    'Supper Admin',
                    style: TextStyle(color: Colors.white),
                  );
                }
              }
              return Container();
            }),
          ),
        ),
        BlocBuilder<DrawerBloc, DrawerState>(
          builder: (context, state) {
            if (state is DrawerSuccess) {
              return ListView(
                shrinkWrap: true,
                children: [
                  if (state.userIdType == 3)
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: systemAdminMenu.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              context.read<HomePageBloc>().add(
                                  ShowDrawerMenuDetails(
                                      menuUrl: systemAdminMenu[index].menuUrl));
                              if (constraints.maxWidth < 600) {
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
                        context.read<HomePageBloc>().add(ShowDrawerMenuDetails(
                            menuUrl: state.menuItemList[index].menuUrl));
                        if (constraints.maxWidth < 600) {
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
                    itemCount: defultMenu.length,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        //context.read<HomePageBloc>().add(ShowDrawerMenuDetails(menuUrl: state.menuItemList[index].menuUrl));
                        if (constraints.maxWidth < 600) {
                          Navigator.pop(context);
                        }
                      },
                      title: Text(defultMenu[index].name.toString()),
                      leading: Icon(iconsMap["${defultMenu[index].icon}"]),
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        )
      ],
    ),
  );
}
