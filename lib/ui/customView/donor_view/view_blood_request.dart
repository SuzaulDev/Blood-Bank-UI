import 'package:blood_bank_app/bloc/home_business_logic/home_page_bloc.dart';
import 'package:blood_bank_app/ui/coustom_widget/status_widget.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/home_business_logic/home_page_event.dart';
import '../../../data/models/blood_request_response_model.dart';
import '../../../utils/const/app_colors.dart';
import '../../coustom_widget/custom_button.dart';

class ViewBloodRequestScreen extends StatelessWidget {
  final List<BloodRequestModel> bloodRequestList;
  const ViewBloodRequestScreen({super.key,required this.bloodRequestList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                              "Hospital Name",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Date Needed",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "City",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Blood Group",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Contact",
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
                  ...bloodRequestList.asMap().entries.map(
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
                                '${student.value.hospitalName}',
                              ),
                            ),
                            Center(
                              child: Text(
                                  formatDate(format: "dd-MM-yyyy", date: DateTime.parse(student.value.dateNeeded!))
                              ),
                            ),
                            Center(
                              child: Text(
                                student.value.city.toString()
                              ),
                            ),
                            Center(
                              child: Text(
                                '${student.value.bloodGroup}',
                              ),
                            ),
                            Center(
                              child: Text(
                                '${student.value.contactNumber}',
                              ),
                            ),
                           student.value.accepted! ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: StatusWidget(status: "ACCEPTED"),
                            ),
                            ) : Wrap(
                              direction: Axis.horizontal,
                              spacing: 5,
                              runSpacing: 1,
                              children: [
                                TextButton(
                                    onPressed: (){
                                      BloodRequestModel bloodRequestModel = student.value;
                                      bloodRequestModel.accepted = true;
                                      print(bloodRequestModel.toJson());
                                      context.read<HomePageBloc>().add(AcceptBloodRequestByDonor(bloodRequestModel: bloodRequestModel));
                                  },
                                    child: Text("Accept"),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                                  ),

                                ),
                                TextButton(
                                    onPressed: (){
                                      //todo: Delete event calling  here
                                    },
                                    child: Text("Reject"),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                                  ),
                                ),
                              ],
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
    );
  }
}
