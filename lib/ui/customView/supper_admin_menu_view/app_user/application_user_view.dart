import 'package:blood_bank_app/data/models/app_user_response_model.dart';
import 'package:blood_bank_app/data/models/menu_item_response_model.dart';
import 'package:blood_bank_app/data/models/password_policy_response_model.dart';
import 'package:blood_bank_app/ui/customView/supper_admin_menu_view/app_user/application_user_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/home_business_logic/home_page_bloc.dart';
import '../../../../bloc/home_business_logic/home_page_event.dart';
import '../../../../utils/const/app_colors.dart';
import '../menu_item/menu_bottom_sheet.dart';

class ApplicationUserView extends StatelessWidget {
  final List<AppUserModel> appUserList;
  final List<PasswordPolicyModel> passwordPolicyList;
   const ApplicationUserView({super.key,required this.appUserList,required this.passwordPolicyList});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return  AppUserBottomSheet(
                      passwordPolicy: passwordPolicyList,
                      titelText: "Application User",
                    );
                  },
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [AppColors.whiteColor, AppColors.redColor]),
                    borderRadius: BorderRadius.all(Radius.circular(23))),
                child: const Center(
                    child: Text(
                      "Add new User",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(width: 2, color: Colors.white70),
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                  5: FlexColumnWidth(),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: AppColors.redColor,
                      border:
                      Border.all(strokeAlign: 0.01, color: Colors.black),
                    ),
                    children: const [
                      Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "SI No",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Name",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Bangla Name",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Menu Type",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Url",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Action",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                  ...appUserList.asMap().entries.map(
                        (student) {
                      return TableRow(
                          decoration: BoxDecoration(
                            border: Border.all(
                                strokeAlign: 0.01, color: Colors.black),
                          ),
                          children: [
                            Center(
                              child: Text(
                                student.value.id.toString(),
                              ),
                            ),
                            Center(
                              child: Text(
                                '${student.value.name}',
                              ),
                            ),
                            Center(
                              child: Text(
                                student.value.banglaName.toString(),
                              ),
                            ),
                            Center(
                              child: Text(
                                '${student.value.displayName}',
                              ),
                            ),
                            Center(
                              child: Text(
                                student.value.active.toString(),
                              ),
                            ),
                            Center(
                              child: Wrap(
                                direction: Axis.horizontal,
                                spacing: 5,
                                runSpacing: 1,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.view_list),
                                    onPressed: (){},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.edit_outlined),
                                    onPressed: (){},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete,color: Colors.red,),
                                    onPressed: () {
                                      //context.read<HomePageBloc>().add(DeleteMenu(menuItem:student.value));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ]);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
