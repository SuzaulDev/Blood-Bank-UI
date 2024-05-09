import 'package:blood_bank_app/data/models/menu_item_response_model.dart';
import 'package:blood_bank_app/data/models/password_policy_response_model.dart';
import 'package:blood_bank_app/ui/customView/supper_admin_menu_view/app_user/application_user_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../../../utils/const/app_colors.dart';
import '../menu_item/menu_bottom_sheet.dart';

class ApplicationUserView extends StatelessWidget {
  final appUserList;
  final List<PasswordPolicyModel> passwordPolicyList;
   ApplicationUserView({super.key,required this.appUserList,required this.passwordPolicyList});

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
                    return  AppUserBottmSheet(
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
            if(appUserList!=null)ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: appUserList.length,
              itemBuilder: (context, index) => ListTile(
                leading: Text(appUserList[index].id.toString()),
                title: Text(appUserList[index].name.toString()),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
