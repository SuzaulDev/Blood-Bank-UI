import 'package:blood_bank_app/bloc/drawer_bloc/drawer_bloc.dart';
import 'package:blood_bank_app/bloc/drawer_bloc/drawer_event.dart';
import 'package:blood_bank_app/bloc/drawer_bloc/drawer_state.dart';
import 'package:blood_bank_app/ui/customView/supper_admin_menu_view/applicationUser.dart';
import 'package:blood_bank_app/ui/customView/supper_admin_menu_view/menu_item_view.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home_business_logic/home_page_bloc.dart';
import '../../bloc/home_business_logic/home_page_event.dart';
import '../../bloc/home_business_logic/home_page_state.dart';
import '../../utils/const/app_colors.dart';
import '../customView/dashboard.dart';
import '../customView/temp_data_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMenuExpanded = false;
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
      child: Scaffold(
        drawer: Drawer(
          width: 250,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero)),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.redColor,
                ),
                child: Center(
                  child: BlocBuilder<DrawerBloc, DrawerState>(
                      builder: (context, state) {
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
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.menuItemList.length,
                      itemBuilder: (context, index) => ListTile(
                        onTap: () {
                          context
                              .read<HomePageBloc>()
                              .add(ShowDrawerMenuDetails(menuSerialNumber: index));
                          Navigator.pop(context);
                        },
                        title: Text(state.menuItemList[index].toString()),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
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
                      print(authToken);
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
          bottom: PreferredSize(
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                SizedBox(
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
                        return dashBoard(state.menuItemList);
                      }
                      return dataView(context, state.userModelList);
                    }
                    if (state is ApplicationUser) {
                      return applicationUserView();
                    }
                    if(state is MenuItem){
                      return MenuItemView();
                    }
                    if (state is HomePageError) {
                      return Center(
                        child: Text(state.errorMessage),
                      );
                    }
                    else {
                      return Container(); // Placeholder for other states if needed
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Feed", icon: Icon(Icons.feed)),
          BottomNavigationBarItem(label: "Account", icon: Icon(Icons.person)),
        ]),
      ),
    );
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

