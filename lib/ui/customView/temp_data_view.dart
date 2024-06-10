import 'package:blood_bank_app/ui/customView/supper_admin_menu_view/app_user/application_user_view.dart';
import 'package:blood_bank_app/ui/customView/supper_admin_menu_view/menu_item/menu_item_view.dart';
import 'package:blood_bank_app/ui/customView/supper_admin_menu_view/password_policy/password_policy.dart';
import 'package:blood_bank_app/ui/customView/supper_admin_menu_view/user_role/user_role_view.dart';
import 'package:blood_bank_app/ui/customView/supper_admin_menu_view/user_role_assign/user_role_asign_view.dart';
import 'package:blood_bank_app/utils/constant_value.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home_business_logic/home_page_bloc.dart';
import '../../bloc/home_business_logic/home_page_state.dart';
import '../../data/models/users_models.dart';
import '../../utils/const/app_colors.dart';
import '../../utils/helper_funtion.dart';
import '../coustom_widget/blood_name_filter_bar.dart';
import '../pages/home_page.dart';
import 'dashboard.dart';
import 'general_user_view/user_dashboard.dart';

Widget dataView(BuildContext context, List<UserModel> userModelList) {
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: userModelList.length,
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/profilePage');
        },
        child: Card(
          child: ListTile(
            leading: CircleAvatar(child: Image.asset('images/person.jpg')),
            title: Text(userModelList[index].name.toString()),
            subtitle: Text(userModelList[index].email.toString()),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              const Text(
                "B+",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppColors.redColor,
                ),
              ),
              Text(
                userModelList[index].id.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppColors.redColor,
                ),
              ),
            ]),
          ),
        ),
      );
    },
  );
}

// Widget extraCode (){
//   return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         bloodName(
//           title: 'A+',
//           colors: Color(0xffff0040),
//           textColors: Color(0xffffffff),
//         ),
//         bloodName(
//           title: 'A-',
//           colors: Color(0xffff0040),
//           textColors: Color(0xffffffff),
//         ),
//         bloodName(
//           title: 'B+',
//           colors: Color(0xffff0040),
//           textColors: Color(0xffffffff),
//         ),
//         bloodName(
//           title: 'B-',
//           colors: Color(0xffff0040),
//           textColors: Color(0xffffffff),
//         ),
//         bloodName(
//           title: 'O+',
//           colors: Color(0xffff0040),
//           textColors: Color(0xffffffff),
//         ),
//         bloodName(
//           title: 'O-',
//           colors: Color(0xffff0040),
//           textColors: Color(0xffffffff),
//         ),
//         bloodName(
//           title: 'AB+',
//           colors: Color(0xffff0040),
//           textColors: Color(0xffffffff),
//         ),
//         bloodName(
//           title: 'AB-',
//           colors: Color(0xffff0040),
//           textColors: Color(0xffffffff),
//         ),
//       ],
//     );
// }


