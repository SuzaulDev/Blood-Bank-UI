import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Intro {
  String title;
  String description;
  String image;

  Intro({required this.title, required this.description, required this.image});
}

List<Intro> introData = [
  Intro(
      title: 'Donated',
      description:
      'Dramatically unfeish Outing vortices\nbefore maintained pations.',
      image: 'images/dr.jpg'),
  Intro(
      title: 'Donated 1',
      description:
      'Dramatically unfeish Outing vortices\nbefore maintained pations.',
      image: 'images/dr.jpg'),
  Intro(
      title: 'Donated 2',
      description:
      'Dramatically unfeish Outing vortices\nbefore maintained pations.',
      image: 'images/dr.jpg'),
];
Widget introPage1(

    ){
  return Column(
    children: [

      Text(
        'Donated 1',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      Text( 'Dramatically unfeish Outing vortices\nbefore maintained pations.'),
    ],
  );
}