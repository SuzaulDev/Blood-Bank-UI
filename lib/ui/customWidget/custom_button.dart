

import 'package:flutter/material.dart';

Widget customButton(
    {
      required onPressed,
      required String text,
    }
    ){
  return ElevatedButton(onPressed: onPressed,
    child: Text(text),style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xffff0040),
      foregroundColor: Colors.white,
      minimumSize: const Size(380, 45),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      )
  ),

  );
}