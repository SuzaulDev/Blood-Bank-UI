import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget customDatePicker({firstDate,suffixIcon,dateController, context,required String label,required  bool isRequired}){

  String formatToIso8601(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date);
  }
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: dateController,
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
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: firstDate != null ? firstDate : DateTime.now(),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          dateController.text = formatToIso8601(pickedDate);
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


