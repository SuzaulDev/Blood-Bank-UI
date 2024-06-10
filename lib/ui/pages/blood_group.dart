import 'package:flutter/material.dart';
import '../../utils/const/app_colors.dart';
import '../coustom_widget/custom_button.dart';



class BloodGroup extends StatelessWidget {
  BloodGroup({super.key});
  List<String> bloodType = ['A', 'B', 'O', 'AB', 'HH'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
        child: Column(
          children: [
            GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Color(0xffff0040),
                            color: Color(0xffFADBD8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                              bloodType[index],
                              style: TextStyle(
                                fontSize: 26,
                                color: AppColors.whiteColor,
                              ),
                            )),
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Color(0xffff0040),
                    color: Color(0xffFADBD8),
                  ),
                  child: Center(
                      child: Text(
                        '+',
                        style: TextStyle(color: AppColors.whiteColor, fontSize: 26),
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Color(0xffff0040),
                    color: Color(0xffFADBD8),
                  ),
                  child: Center(
                      child: Text(
                        '-',
                        style: TextStyle(color: AppColors.whiteColor, fontSize: 26),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            customButton(onPressed: () {}, text: 'Continue'),
          ],
        ),
      ),
    );
  }
}
