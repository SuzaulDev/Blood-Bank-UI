import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/const/app_colors.dart';


Widget login_customButton(
    {required String title,
    required onPressed,
    String? imageUrl,
    Color? backgroundColor}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor!,
      foregroundColor: AppColors.whiteColor,
      minimumSize: Size(360, 50),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (imageUrl != null)
          Image.asset(
            imageUrl,
            height: 30,
          ),
        SizedBox(
          width: 5,
        ),
        Text(title),
      ],
    ),
  );
}
