import 'package:blood_bank_app/utils/const/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget customSaveButton({required IconData icon, required titel, btnColor,isDisable,required onClick}) {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: btnColor ?? AppColors.redColor,
        child: TextButton(
          onPressed: onClick,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,color: Colors.white,),
              const SizedBox(
                width: 10,
              ),
              Text(titel,style: TextStyle(
                  color:Colors.white ,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),)
            ],
          ) ,
        ),
      ),
  );
}
