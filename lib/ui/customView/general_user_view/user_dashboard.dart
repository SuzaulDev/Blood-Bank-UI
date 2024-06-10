import 'package:blood_bank_app/bloc/home_business_logic/home_page_bloc.dart';
import 'package:blood_bank_app/bloc/home_business_logic/home_page_state.dart';
import 'package:blood_bank_app/data/models/blood_donor_response_model.dart';
import 'package:blood_bank_app/ui/coustom_widget/custom_responsive_card.dart';
import 'package:blood_bank_app/utils/constant_value.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/blood_request_response_model.dart';

class UserDashBoard extends StatelessWidget {
  final List<DonorInfoModel> donorList;
  final List<BloodRequestModel> bloodRequest;
  final double screenWidth;

  const UserDashBoard({super.key,required this.screenWidth,required this.donorList,required this.bloodRequest});

  @override
  Widget build(BuildContext context) {
    final int peopleCount = 75; // Example value
    final int maxPeople = 100;  // Example maximum value
    final double percentage = peopleCount / maxPeople;
    return  Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ResponsiveCard(
                    title: 'Donors',
                    amount: donorList.length,
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 2),
                  ),
                ),
                Expanded(
                  child: ResponsiveCard(
                    title: 'Donations',
                    amount: bloodRequest.length,
                    backgroundColor: Colors.redAccent,
                    duration: Duration(seconds: 2),
                  ),
                ),
              ],
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: screenWidth < 600 ? 3:4),
                itemBuilder: (context, index) => SfCircularChart(
                  annotations:<CircularChartAnnotation>[
                    CircularChartAnnotation(
                      widget:  Text( bloodGroupTypeList[index].name,
                        style: TextStyle(
                          fontSize: screenWidth < 600 ? 40 : 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  series: <CircularSeries>[
                    RadialBarSeries<BloodGroup, String>(
                      dataSource: [bloodGroupTypeList[index]],
                      pointColorMapper: (data, _) => bloodGroupTypeList[index].color,
                      opacity: 1.0,
                      trackOpacity: 0.3,
                      trackColor: CupertinoColors.systemYellow,
                      xValueMapper: (data, _) => data.name,
                      yValueMapper: (data, _) => data.amount,
                      maximumValue: 10,
                      radius: '70%',
                      innerRadius: '80%',
                      cornerStyle: CornerStyle.bothCurve,
                      gap: '10%',
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}
