import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCityDropdown extends StatefulWidget {
  final dropDownList;
  final controller;
  final hintText;
  final bool isRequired;
  final Function selectedValue;

  const CustomCityDropdown(
      {super.key,
        required this.dropDownList,
        this.controller,
        required this.hintText,
        required this.isRequired,
        required this.selectedValue});

  @override
  State<CustomCityDropdown> createState() => _CustomCityDropdownState();
}

class _CustomCityDropdownState extends State<CustomCityDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownMenu<String>(
        expandedInsets: EdgeInsets.zero,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(widget.hintText),
            ),
            if (widget.isRequired)
              const Icon(
                CupertinoIcons.staroflife_fill,
                color: Colors.redAccent,
                size: 15,
              )
          ],
        ),
        controller: widget.controller,
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onSelected: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            widget.selectedValue(value!);
          });
        },
        dropdownMenuEntries:
        widget.dropDownList.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    );
  }
}



