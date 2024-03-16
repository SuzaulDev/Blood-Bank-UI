

import 'package:blood_bank_app/pages/blood_group.dart';
import 'package:blood_bank_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../const/app_colors.dart';

class BloodType extends StatelessWidget {
  const BloodType({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Select a Blood Type',style: TextStyle(color:  AppColors.whiteColor,),),
      centerTitle: true,
        toolbarHeight: 120,
   backgroundColor: AppColors.redColor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(35),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                bloodName(title: 'B+', colors: Color(0xffffffff),textColors: Color(0xffff0040),),
                bloodName(title: 'A+', colors: Colors.black12,textColors: Color(0xffffffff),),
                bloodName(title: 'AB+', colors:Colors.black12,textColors: Color(0xffffffff),),
                bloodName(title: 'B+', colors: Colors.black12,textColors: Color(0xffffffff),),
                bloodName(title: 'O+', colors: Colors.black12,textColors: Color(0xffffffff),),
                bloodName(title: 'B+', colors:Colors.black12,textColors: Color(0xffffffff),),
                bloodName(title: 'B-', colors: Colors.black12,textColors: Color(0xffffffff),),
              ],
            )
          ),
        ),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(child: Text('Select The Distance',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w400),)),
          ),
          SizedBox(
            height: 50.h,
          ),
          CircularPercentIndicator(
            radius: 120.0,
            lineWidth: 13.0,
            animation: true,
            percent: 0.7,
            center:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "70",
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                Text(
                  "Distance (km)",
                  style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,color: Colors.blueGrey),
                ),
              ],
            ),

            circularStrokeCap: CircularStrokeCap.round,
            progressColor:  AppColors.redColor,
          ),
          SizedBox(
            height: 30.h,
          ),
          bloodTypeCustomButton(onPressed: (){
           // Navigator.push(context, MaterialPageRoute(builder: (context)=>BloodGroup()));
            Navigator.pushNamed(context, '/bloodGroup');
          }, title: 'Find Donor')
        ],
      ),
    );
  }
}
Widget bloodTypeCustomButton(
{
  required onPressed,
  required String title,

}
    ){
  return ElevatedButton(
      onPressed: onPressed,
      child: Text(title,style: TextStyle(fontSize: 17.sp),),
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.redColor,
    foregroundColor:  AppColors.whiteColor,

    minimumSize: Size(230, 40),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8)
    ),

  ),
  );
}