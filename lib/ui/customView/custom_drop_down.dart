
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
    final dropDownList;
    final controller;
    final hintText;
    final bool isRequired;
   const CustomDropdownMenu({super.key,required this.dropDownList,required this.controller,required this.hintText,required this.isRequired});

  @override
  State<CustomDropdownMenu> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<CustomDropdownMenu> {
  String dropdownValue = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownMenu<String>(
        expandedInsets: EdgeInsets.zero,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.hintText),
            if(widget.isRequired)const Icon(CupertinoIcons.staroflife_fill,color: Colors.redAccent,size: 15,)
          ],
        ),
        controller: widget.controller,
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        initialSelection: widget.dropDownList.first,
        onSelected: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        dropdownMenuEntries: widget.dropDownList.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    );
  }
}