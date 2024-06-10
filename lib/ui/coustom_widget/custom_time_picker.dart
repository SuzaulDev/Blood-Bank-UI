import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


  Widget customTimePicker({suffixIcon,timeController,context,required String label,required  bool isRequired}) {
    String formatToIso8601(TimeOfDay time) {
      final now = DateTime.now();
      return DateFormat("HH:mm").format(DateTime(now.year, now.month, now.day,time.hour, time.minute));
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: timeController,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(label),
              ),
              if (isRequired)
                const Icon(
                  CupertinoIcons.staroflife_fill,
                  color: Colors.redAccent,
                  size: 15,
                )
            ],
          ),
          border: OutlineInputBorder(),
        ),
        readOnly: true,
        onTap: () async {
          TimeOfDay? pickedTime = await showTimePicker(
              context: context, initialTime: TimeOfDay.now());
          if (pickedTime != null) {
            timeController.text = formatToIso8601(pickedTime) ;
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select a date';
          }
          return null;
        },
      ),
    );
  }
