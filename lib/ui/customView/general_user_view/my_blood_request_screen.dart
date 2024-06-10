import 'package:blood_bank_app/ui/coustom_widget/availability_widget.dart';
import 'package:blood_bank_app/ui/coustom_widget/status_widget.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/home_business_logic/home_page_bloc.dart';
import '../../../bloc/home_business_logic/home_page_event.dart';
import '../../../data/models/blood_request_response_model.dart';
import '../../../utils/const/app_colors.dart';

class MyBloodRequestScreen extends StatelessWidget {
  final List<BloodRequestModel>  myBloodRequest;
  const MyBloodRequestScreen({super.key,required this.myBloodRequest});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: myBloodRequest.isNotEmpty ? Table(
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
                              "Time",
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
                              "Action",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                 ...myBloodRequest.asMap().entries.map(
                        (student) {
                      return TableRow(
                          decoration: BoxDecoration(
                            border: Border.all(
                                strokeAlign: 0.01, color: Colors.black),
                          ),
                          children: [
                            Center(
                              child: Text(
                                "${student.key+1}",
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
                                  formatTime(format: "HH:mm", time: DateTime.parse(student.value.dateNeeded!))
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
                            Wrap(
                              direction: Axis.horizontal,
                              spacing: 5,
                              runSpacing: 1,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.transform_rounded,color: Colors.blueAccent,),
                                  onPressed: () {
                                    showDialog(context: context, builder: (context) => AlertDialog(
                                      title: Text("Request Progress"),
                                      content: Row(
                                        children: [
                                          StatusWidget(status: "PENDING"),
                                          if(student.value.accepted!)StatusWidget(status:  "ACCEPTED" ),
                                          if(student.value.processing!)StatusWidget(status: "PROCESSING"),
                                          if(student.value.completed!)StatusWidget(status: "COMPLETE"),
                                        ],
                                      ),
                                    ),);
                                  },
                                ),
                               if(!student.value.accepted!)IconButton(
                                  icon: Icon(Icons.edit_outlined),
                                  onPressed: (){
                                    //TODO: EDIT EVENT CALL
                                  },
                                ),
                                if(student.value.accepted! && !student.value.processing! && !student.value.completed! )
                                  TextButton(onPressed: (){
                                    student.value.processing = true;
                                    context.read<HomePageBloc>().add(OnProcessingBloodRequest(bloodRequestModel: student.value));
                                  },
                                    child: Text("Start Donation")),
                                if(!student.value.accepted!)IconButton(
                                  icon: Icon(Icons.delete,color: Colors.red,),
                                  onPressed: () {
                                    //TODO: DELETE EVENT CALL
                                  },
                                ),
                                if(student.value.completed!)TextButton.icon(
                                    onPressed: (){
                                      //TODO: GENERATE TESTIMONIAL AS PDF
                                    },
                                    icon: Icon(Icons.print,color: Colors.blue,),
                                    label: Text("Print"),
                                )
                              ],
                            ),

                          ]);
                    },
                  ),
                ],
              ) : const Center(child: Text("No Data")),
            ),
          ],
        ),
      ),
    );
  }
}
