import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../data/models/menu_item_response_model.dart';

class CustomDropdownMenu extends StatefulWidget {
  final dropDownList;
  final controller;
  final hintText;
  final bool isRequired;
  final Function selectedValue;

  const CustomDropdownMenu(
      {super.key,
      required this.dropDownList,
        this.controller,
      required this.hintText,
      required this.isRequired,
      required this.selectedValue});

  @override
  State<CustomDropdownMenu> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<CustomDropdownMenu> {
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
            widget.dropDownList.map<DropdownMenuEntry<String>>((e) {
          return DropdownMenuEntry(value: e.id.toString(), label: e.name!);
        }).toList(),
      ),
    );
  }
}

// map<DropdownMenuEntry<String>>((String value) {
// return DropdownMenuEntry<String>(value: value, label: value);
// }).toList(),
