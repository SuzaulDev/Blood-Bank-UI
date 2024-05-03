import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/users_models.dart';
import '../../utils/const/app_colors.dart';

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