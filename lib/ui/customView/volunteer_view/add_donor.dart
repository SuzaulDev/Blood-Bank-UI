import 'package:blood_bank_app/ui/coustom_widget/add_blood_donors_form.dart';
import 'package:blood_bank_app/ui/coustom_widget/availability_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/models/blood_donor_response_model.dart';
import '../../../data/models/password_policy_response_model.dart';
import '../../../utils/const/app_colors.dart';


class AddDonorView extends StatelessWidget {
  final List<PasswordPolicyModel> passwordPolicy;
  final  List<DonorInfoModel> donorInfoModelList;
   AddDonorView({super.key,required this.donorInfoModelList, required this.passwordPolicy});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  int _currentPage = 2;
  final int _totalPages = 20;
  String _searchQuery = '';
  String _filter = 'All';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: donorInfoModelList.isNotEmpty ? Table(
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
                  ...donorInfoModelList.asMap().entries.map(
                        (donorInfoModel) {
                      return TableRow(
                          decoration: BoxDecoration(
                            border: Border.all(
                                strokeAlign: 0.01, color: Colors.black),
                          ),
                          children: [
                            Center(
                              child: Text(
                                "${donorInfoModel.key+1}",
                              ),
                            ),
                            Center(
                              child: Text(
                                '${donorInfoModel.value.appUserDto!.displayName}',
                              ),
                            ),
                            Center(
                              child: Text(
                                donorInfoModel.value.donorInfoDto!.city.toString(),
                              ),
                            ),
                            Center(
                              child: Text(
                                '${donorInfoModel.value.donorInfoDto!.bloodGroup}',
                              ),
                            ),
                            Center(
                              child: Text(
                                '${donorInfoModel.value.appUserDto!.mobile}',
                              ),
                            ),
                            Center(
                              child: AvailabilityWidget(isAvailable: donorInfoModel.value.donorInfoDto!.available!)
                            ),
                            Center(
                                child:Wrap(
                                  direction: Axis.horizontal,
                                  spacing: 5,
                                  runSpacing: 1,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.transform_rounded,
                                        color: Colors.blueAccent,
                                      ),
                                      onPressed: () {
                                        //context.read<HomePageBloc>().add(DeleteMenu(menuItem:student.value));
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.edit_outlined,
                                        color: Colors.blueAccent,
                                      ),
                                      onPressed: () {
                                        //context.read<HomePageBloc>().add(DeleteMenu(menuItem:student.value));
                                      },
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
                  )
                ],
              ) : Text("No Data"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
              onPressed: _currentPage > 0 ? _previousPage : null,
            ),
            Text(
              'Page ${_currentPage + 1} of $_totalPages',
              style: TextStyle(color: Colors.black),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
              onPressed: _currentPage < _totalPages - 1 ? _nextPage : null,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.redColor,
          elevation: 10,
          tooltip: "Add New Blood Donor",
          onPressed: (){
              showModalBottomSheet(
                barrierColor: Colors.transparent,
                isDismissible: false,
                showDragHandle: true,
                enableDrag: true,
                backgroundColor: Colors.white,
                context: context,
                builder: (context) =>  SingleChildScrollView(
                  child: AddDonorForm(titelText: "Add New Donor",passwordPolicy: passwordPolicy,),
                ),);
          },
          label: const Row(
            children: [
              Icon(Icons.add,color: Colors.white,),
              Text("Add Donor",style: TextStyle(color: Colors.white),),
            ],
          ),
      )
    );
  }

  void _updateSearchQuery(String query) {
    _searchQuery = query;
  }

  void _updateFilter(String? filter) {
    _filter = filter!;
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
    }

  }

  void _nextPage() {
    if (_currentPage < _totalPages - 1 ){
      _currentPage++;
    }

  }




}
