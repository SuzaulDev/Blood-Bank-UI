import 'package:blood_bank_app/pages/blood_type.dart';
import 'package:blood_bank_app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.redColor,
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: AppColors.whiteColor,
        ),
        title: Text(
          'Home',
          style: TextStyle(
              color: AppColors.whiteColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/profilePage');
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
              },
              child: CircleAvatar(
                radius: 15.r,
                backgroundImage: AssetImage('images/person.jpg'),
              ),
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
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
              InkWell(
                onTap: () {
                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>BloodType()));
                  Navigator.pushNamed(context, '/bloodType');
                },
                child: Card(
                  child: customListitle(
                      uriImage: 'images/person.jpg',
                      title: 'Sajib Hasan',
                      subtitle: 'Mirpur 1,Dhaka,Bangladesh',
                      trailingtitle: 'O+'),
                ),
              ),
              Card(
                child: customListitle(
                    uriImage: 'images/person.jpg',
                    title: 'Sajib Hasan',
                    subtitle: 'Mirpur 1,Dhaka,Bangladesh',
                    trailingtitle: 'B+'),
              ),
              Card(
                child: customListitle(
                    uriImage: 'images/person.jpg',
                    title: 'Sajib Hasan',
                    subtitle: 'Bonani ,Dhaka,Bangladesh',
                    trailingtitle: 'B+'),
              ),
              Card(
                child: customListitle(
                    uriImage: 'images/person.jpg',
                    title: 'Sajib Hasan',
                    subtitle: 'Uttara,Dhaka,Bangladesh',
                    trailingtitle: 'AB+'),
              ),
              Card(
                child: customListitle(
                    uriImage: 'images/person.jpg',
                    title: 'Sajib Hasan',
                    subtitle: 'Dhanmondi,Dhaka,Bangladesh',
                    trailingtitle: 'B+'),
              ),
              Card(
                child: customListitle(
                    uriImage: 'images/person.jpg',
                    title: 'Sajib Hasan',
                    subtitle: 'Dhanmondi,Dhaka,Bangladesh',
                    trailingtitle: 'B-'),
              ),
              Card(
                child: customListitle(
                    uriImage: 'images/person.jpg',
                    title: 'Sajib Hasan',
                    subtitle: 'Dhanmondi,Dhaka,Bangladesh',
                    trailingtitle: 'B+'),
              ),
              Card(
                child: customListitle(
                    uriImage: 'images/person.jpg',
                    title: 'Sajib Hasan',
                    subtitle: 'Dhanmondi,Dhaka,Bangladesh',
                    trailingtitle: 'B+'),
              ),
            ],
          ),
        ),
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

Widget customListitle({
  required String uriImage,
  required String title,
  required String subtitle,
  required String trailingtitle,
}) {
  return ListTile(
    leading: SizedBox(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Image.asset(uriImage)),
    ),
    title: Text(title),
    subtitle: Text(subtitle),
    trailing: Column(
      children: [
        Text(
          trailingtitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: AppColors.redColor,
          ),
        ),
      ],
    ),
  );
}
