

import 'package:flutter/material.dart';

Widget customButton(
    {
      required onPressed,
      required String text,
      isDisable,
      isCornerRadius,
      backgroundColor,
      foregroundColor,
    }
    ){
  return ElevatedButton(onPressed: onPressed,
    child: Text(text),style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor != null ? backgroundColor : Color(0xffff0040),
      foregroundColor: foregroundColor!= null ? foregroundColor: Colors.white,
      minimumSize: const Size(380, 45),
      shape:  RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(isCornerRadius ? 10 : 0)
      )
  ),

  );
}