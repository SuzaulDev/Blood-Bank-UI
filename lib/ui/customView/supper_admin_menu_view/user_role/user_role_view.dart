import 'package:flutter/material.dart';

import '../../../../data/models/user_role_response_model.dart';
import '../../../../utils/const/app_colors.dart';

class UserRoleView extends StatefulWidget {
  final List<UserRoleModel> userRoleList;

  const UserRoleView({super.key, required this.userRoleList});

  @override
  State<UserRoleView> createState() => _UserRoleViewState();
}

class _UserRoleViewState extends State<UserRoleView> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildPanel(),
            ),
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
          widget.userRoleList[index].isExpanded = isExpanded;
        });

      },
      children: widget.userRoleList.map<ExpansionPanel>((UserRoleModel item) {
        return ExpansionPanel(
          headerBuilder: (context, isExpanded) {

            return ListTile(
              leading: Text(item.userRoleMaster!.id.toString()),
              title: Text(item.userRoleMaster!.name.toString()),
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
                ...item.userRoleDetailsList!.asMap().entries.map(
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
                              '${student.value.menuItemName}',
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
                                  onPressed: () {},
                                ),
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
                                    //context.read<HomePageBloc>().add(DeleteMenu(menuItem:student.value));
                                  },
                                ),
                              ],
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


