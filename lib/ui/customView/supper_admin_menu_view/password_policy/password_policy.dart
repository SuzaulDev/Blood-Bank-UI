import 'package:blood_bank_app/data/models/password_policy_response_model.dart';
import 'package:flutter/material.dart';

import '../../../../utils/const/app_colors.dart';

class PasswordPolicyView extends StatelessWidget {
  final List<PasswordPolicyModel> passwordPolicyList;

  const PasswordPolicyView({super.key, required this.passwordPolicyList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
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
                  ...passwordPolicyList.asMap().entries.map(
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
                                student.value.minLength.toString(),
                              ),
                            ),
                            Center(
                              child: Text(
                                student.value.passwordRemember.toString(),
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
            )
          ],
        ),
      ),
    );
  }
}
