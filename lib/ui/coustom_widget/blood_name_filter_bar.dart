import 'package:blood_bank_app/bloc/home_business_logic/home_page_bloc.dart';
import 'package:blood_bank_app/bloc/home_business_logic/home_page_event.dart';
import 'package:blood_bank_app/utils/const/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constant_value.dart';

class BloodNameFilterBar extends StatefulWidget {
  final screenWidth;
  const BloodNameFilterBar({super.key, this.screenWidth});


  @override
  State<BloodNameFilterBar> createState() => _BloodNameFilterBarState();
}

class _BloodNameFilterBarState extends State<BloodNameFilterBar> {
  int selectedIndex = -1; // -1 means no item is selected

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: widget.screenWidth <600 ? 8:16, crossAxisSpacing: widget.screenWidth < 600 ? 3.0:15.0),
      itemCount: bloodGroupTypeList.length,
      itemBuilder: (context, index) => InkWell(
        onTap: (){
          setState(() {
            selectedIndex = index;
              context.read<HomePageBloc>().add(FilterByBloodGroup(bloodGroup: bloodGroupTypeList[index].name));
          });
        },
        child: Container(
          height: 35,
          width: 35,
          decoration:
          BoxDecoration(color: selectedIndex == index ?  Colors.red : Colors.grey , borderRadius: BorderRadius.circular(5)),
          child: Center(
              child: Text(
                bloodGroupTypeList[index].name,
                style: TextStyle(color: AppColors.whiteColor),
              )),
        ),
      ),
    );

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}


