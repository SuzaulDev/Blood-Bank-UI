import 'package:blood_bank_app/ui/customView/supper_admin_menu_view/user_role_assign/user_role_assign_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/home_business_logic/home_page_bloc.dart';
import '../../../../bloc/home_business_logic/home_page_event.dart';
import '../../../../data/models/app_user_response_model.dart';
import '../../../../data/models/user_role_assign_model.dart';
import '../../../../data/models/user_role_response_model.dart';
import '../../../../utils/const/app_colors.dart';

class UserRoleAssignView extends StatefulWidget {
  final List<UserRoleAssignModel> userRoleAssignList;
  final List<AppUserModel> appUserModelList;
  final List<UserRoleModel> userRoleModelList;

  const UserRoleAssignView({super.key, required this.userRoleAssignList,required this.appUserModelList, required this.userRoleModelList,});

  @override
  State<UserRoleAssignView> createState() => _UserRoleAssignViewState();
}

class _UserRoleAssignViewState extends State<UserRoleAssignView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                showBottomSheet(context: context, builder: (context) =>
                    UserRoleAssignBottomSheet(appUserModel:widget.appUserModelList,userRoleModel: widget.userRoleModelList, titelText: "User Role Assign"),);
              },
              child: Text("Add New"),
            ),
            widget.userRoleAssignList.isNotEmpty ?_buildPanel(): Center(child: Text("No Data Found")),
          ],
        ),
      ),
    );
  }


  Widget _buildPanel() {
    return ExpansionPanelList(
      elevation: 2,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          widget.userRoleAssignList[index].isExpanded = isExpanded;
        });

      },
      children: widget.userRoleAssignList.map<ExpansionPanel>((UserRoleAssignModel item) {
        return ExpansionPanel(
          headerBuilder: (context, isExpanded) {

            return ListTile(
              leading: Text(item.master!.appUserId.toString()),
              title: Text(item.master!.appUserName.toString()),
              trailing:  SizedBox(
                width: 120,
                child: Center(
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 5,
                    runSpacing: 1,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.edit_outlined),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          context.read<HomePageBloc>().add(DeleteUserRoleAssign( userRoleAssignModel: item));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          body: Padding(
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
                    border: Border.all(strokeAlign: 0.01, color: Colors.black),
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
                            "Status",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ],
                ),
                ...item.detailsList!.asMap().entries.map(
                      (student) {
                    return TableRow(
                        decoration: BoxDecoration(
                          border: Border.all(strokeAlign: 0.01, color: Colors.black),
                        ),
                        children: [
                          Center(
                            child: Text(
                              student.value.id.toString(),
                            ),
                          ),
                          Center(
                            child: Text(
                              '${student.value.userRoleId}',
                            ),
                          ),
                          Center(
                            child: Text(
                              student.value.userRoleName.toString(),
                            ),
                          ),
                        ]);
                  },
                ),
              ],
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }



}


