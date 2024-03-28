import 'package:blood_bank_app/utils/helper_funtion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/home_business_logic/home_page_bloc.dart';
import '../../bloc/home_business_logic/home_page_event.dart';
import '../../bloc/home_business_logic/home_page_state.dart';
import '../../data/models/users_models.dart';
import '../../utils/const/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomePageBloc>().add(LoadHomePage());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
      return WillPopScope(

        onWillPop: () async{
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
          appBar: AppBar(
            backgroundColor: AppColors.redColor,
            centerTitle: true,
            leading: const Icon(
              Icons.menu,
              color: AppColors.whiteColor,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                  color: AppColors.whiteColor, fontWeight: FontWeight.bold),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: BlocBuilder<HomePageBloc,HomePageState>(builder: (context, state) {
                  if(state is HomePageLoaded){

                    if (state.authToken != "" && state.authToken != "null") {
                      print(state.authToken);
                      return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, "/profilePage");
                      },
                      child: const CircleAvatar(
                        backgroundImage: AssetImage("images/person.jpg"),
                      ),
                    );
                    } else {
                      return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, "/loginPage");

                      },
                      child: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                    );
                    }
                  }
                  else{
                    return Container();
                  }


                },),
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
                      } else if (state is HomePageLoaded) {
                        return _dataView(context, state.userModelList);
                      } else if (state is HomePageError) {
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
          bottomNavigationBar: BottomNavigationBar(items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: "Feed", icon: Icon(Icons.feed)),
            BottomNavigationBarItem(label: "Account", icon: Icon(Icons.person)),
          ]),
        ),
      );
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

Widget _dataView(BuildContext context, List<UserModel> userModelList) {
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: userModelList.length,
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/profilePage');
        },
        child: Card(
          child: ListTile(
            leading: CircleAvatar(child: Image.asset('images/person.jpg')),
            title: Text(userModelList[index].name.toString()),
            subtitle: Text(userModelList[index].email.toString()),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              Text(
                "B+",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppColors.redColor,
                ),
              ),
              Text(
                userModelList[index].id.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppColors.redColor,
                ),
              ),
            ]),
          ),
        ),
      );
    },
  );
}
