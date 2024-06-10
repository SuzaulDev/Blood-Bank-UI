import 'package:blood_bank_app/bloc/home_business_logic/home_page_bloc.dart';
import 'package:blood_bank_app/bloc/home_business_logic/home_page_event.dart';
import 'package:blood_bank_app/data/models/blood_request_response_model.dart';
import 'package:blood_bank_app/ui/coustom_widget/availability_widget.dart';
import 'package:blood_bank_app/ui/coustom_widget/customCityDropdown.dart';
import 'package:blood_bank_app/ui/coustom_widget/custom_button.dart';
import 'package:blood_bank_app/ui/coustom_widget/custom_date_picker.dart';
import 'package:blood_bank_app/ui/coustom_widget/custom_text_field.dart';
import 'package:blood_bank_app/ui/coustom_widget/custom_time_picker.dart';
import 'package:blood_bank_app/ui/customView/temp_data_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../data/models/blood_donor_response_model.dart';
import '../../../utils/const/app_colors.dart';
import '../../../utils/constant_value.dart';
import '../../coustom_widget/blood_name_filter_bar.dart';
import '../../coustom_widget/custom_menu_text_field.dart';

class BloodRequestScreen extends StatelessWidget {
  final List<DonorInfoModel> donorInfoModelList;
  final List<String> cityList;
   BloodRequestScreen({super.key,required this.donorInfoModelList,required this.cityList});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();
  bool isSelected = false;
  int _currentPage = 2;
  final int _totalPages = 20;
  String _searchQuery = '';
  String _filter = 'All';

  int selectedIndex = -1; // -1 means no item is selected

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.redColor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(12),
          child: Padding(
            padding: const EdgeInsets.only(left:70 ,right: 70,bottom: 10),
            child: customSearchField(context: context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: screenWidth <600 ? 2 : 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BloodNameFilterBar(screenWidth: screenWidth,) ,
                  ),
                ),
                Expanded(
                  flex: screenWidth <600 ? 1 : 1,
                    child: CustomCityDropdown(
                        dropDownList: cityList,
                        hintText: "Select City",
                        isRequired: false,
                        selectedValue: (selectedValue){
                          context.read<HomePageBloc>().add(FilterByCityName(cityName:selectedValue));
                        },
                    ),
                ),
              ],
            ),

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
                                '${student.value.appUserDto!.displayName}',
                              ),
                            ),
                            Center(
                              child: Text(
                                student.value.donorInfoDto!.city.toString(),
                              ),
                            ),
                            Center(
                              child: Text(
                                '${student.value.donorInfoDto!.bloodGroup}',
                              ),
                            ),
                            Center(
                              child: Text(
                                '${student.value.appUserDto!.mobile}',
                              ),
                            ),
                            Center(
                              child: AvailabilityWidget(isAvailable: student.value.donorInfoDto!.available!),
                            ),
                            Center(
                              child: customButton(
                                  onPressed: student.value.donorInfoDto!.available! ? (){
                                    final formKey = GlobalKey<FormState>();
                                    final _nameController = TextEditingController();
                                    final _phoneNumberController = TextEditingController();
                                    final _hospitalNameController = TextEditingController();
                                    final _cityNameController = TextEditingController();
                                    final _dateController = TextEditingController();
                                    final _timeController = TextEditingController();
                                    showDialog(context: context, builder: (context) => AlertDialog(
                                      title: const Center(child: Text("Receiver Information",style: TextStyle(fontSize: 16),)),
                                      content:  Form(
                                        key: formKey,
                                          child: SizedBox(
                                            height: 200,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  customMenuInputField(
                                                      hintText: "Name",
                                                      keyboardType: TextInputType.text,
                                                      controller: _nameController,
                                                      isRequired: true),
                                                  customMenuInputField(
                                                      hintText: "Phone Number",
                                                      keyboardType: TextInputType.text,
                                                      controller: _phoneNumberController,
                                                      isRequired: true),
                                                  customMenuInputField(
                                                      hintText: "Hospital Name",
                                                      keyboardType: TextInputType.text,
                                                      controller: _hospitalNameController,
                                                      isRequired: true),
                                                  customMenuInputField(
                                                      suffixIcon: Icon(CupertinoIcons.location_solid),
                                                      hintText: "City",
                                                      keyboardType: TextInputType.text,
                                                      controller: _cityNameController,
                                                      isRequired: true),
                                                  customDatePicker(
                                                    suffixIcon: Icon(Icons.date_range_rounded),
                                                    isRequired: true,
                                                    label: "Date Needed",
                                                    firstDate: DateTime.now(),
                                                    dateController: _dateController,
                                                    context: context,
                                                  ),
                                                  customTimePicker(
                                                    timeController: _timeController,
                                                      label: "Select Time",
                                                      context: context,
                                                      isRequired: false
                                                  ),

                                                ],
                                              ),
                                            ),
                                          )
                                      ),

                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            // Handle the Cancel action
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            String dateTime = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(DateTime.parse(_dateController.text).toUtc()) ;
                                            if(_timeController.text.isNotEmpty){
                                              dateTime = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(DateTime.parse("${_dateController.text}T${_timeController.text}"));
                                            }
                                            // Handle the Submit action
                                            BloodRequestModel model = BloodRequestModel();
                                            model.name = _nameController.text;
                                            model.bloodGroup = student.value.donorInfoDto!.bloodGroup;
                                            model.city = _cityNameController.text;
                                            model.hospitalName = _hospitalNameController.text;
                                            model.contactNumber = _phoneNumberController.text;
                                            model.dateNeeded =dateTime;
                                            model.estimatedTime = dateTime;
                                            model.donorId = student.value.appUserDto!.id;
                                            print(model.toJson());

                                            if(_nameController.text.isEmpty || _cityNameController.text.isEmpty || _hospitalNameController.text.isEmpty|| _phoneNumberController.text.isEmpty || _dateController.text.isEmpty){
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all field')));
                                            }
                                            else{
                                              context.read<HomePageBloc>().add(SendBloodRequest(bloodRequestModel:model ));
                                              Navigator.of(context).pop();
                                            }

                                          },
                                          child: Text('Submit'),
                                        ),
                                      ],




                                    ),);
                                  } : null,
                                  isCornerRadius: false,
                                  text: "Request",
                              )
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

      /// this is an form
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     showBottomSheet(context: context, builder: (context) =>  SingleChildScrollView(
      //       child: Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: Form(
      //           key: _formKey,
      //           child: Column(
      //             children: [
      //               TextFormField(
      //                 decoration: InputDecoration(
      //                   labelText: 'Patient Name',
      //                   border: OutlineInputBorder(),
      //                 ),
      //                 validator: (value) {
      //                   if (value == null || value.isEmpty) {
      //                     return 'Please enter the patient\'s name';
      //                   }
      //                   return null;
      //                 },
      //               ),
      //               SizedBox(height: 16.0),
      //               DropdownButtonFormField<String>(
      //                 decoration: InputDecoration(
      //                   labelText: 'Blood Type',
      //                   border: OutlineInputBorder(),
      //                 ),
      //                 items: [
      //                   DropdownMenuItem(child: Text('A+'), value: 'A+'),
      //                   DropdownMenuItem(child: Text('A-'), value: 'A-'),
      //                   DropdownMenuItem(child: Text('B+'), value: 'B+'),
      //                   DropdownMenuItem(child: Text('B-'), value: 'B-'),
      //                   DropdownMenuItem(child: Text('AB+'), value: 'AB+'),
      //                   DropdownMenuItem(child: Text('AB-'), value: 'AB-'),
      //                   DropdownMenuItem(child: Text('O+'), value: 'O+'),
      //                   DropdownMenuItem(child: Text('O-'), value: 'O-'),
      //                 ],
      //                 validator: (value) {
      //                   if (value == null || value.isEmpty) {
      //                     return 'Please select a blood type';
      //                   }
      //                   return null;
      //                 },
      //                 onChanged: (value) {},
      //               ),
      //               SizedBox(height: 16.0),
      //               TextFormField(
      //                 decoration: InputDecoration(
      //                   labelText: 'Units of Blood Required',
      //                   border: OutlineInputBorder(),
      //                 ),
      //                 keyboardType: TextInputType.number,
      //                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      //                 validator: (value) {
      //                   if (value == null || value.isEmpty) {
      //                     return 'Please enter the number of units required';
      //                   }
      //                   if (int.tryParse(value) == null) {
      //                     return 'Please enter a valid number';
      //                   }
      //                   return null;
      //                 },
      //               ),
      //               SizedBox(height: 16.0),
      //               TextFormField(
      //                 decoration: InputDecoration(
      //                   labelText: 'Hospital Name',
      //                   border: OutlineInputBorder(),
      //                 ),
      //                 validator: (value) {
      //                   if (value == null || value.isEmpty) {
      //                     return 'Please enter the hospital name';
      //                   }
      //                   return null;
      //                 },
      //               ),
      //               SizedBox(height: 16.0),
      //               TextFormField(
      //                 decoration: InputDecoration(
      //                   labelText: 'Contact Number',
      //                   border: OutlineInputBorder(),
      //                 ),
      //                 keyboardType: TextInputType.phone,
      //                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      //                 validator: (value) {
      //                   if (value == null || value.isEmpty) {
      //                     return 'Please enter a contact number';
      //                   }
      //                   if (value.length != 10) {
      //                     return 'Please enter a valid 10-digit phone number';
      //                   }
      //                   return null;
      //                 },
      //               ),
      //               SizedBox(height: 16.0),
      //               customDatePicker(
      //                 isRequired: true,
      //                 label: "Date Needed",
      //                   context: context,
      //                   dateController: _dateController
      //               ),
      //               SizedBox(height: 32.0),
      //               ElevatedButton(
      //                 onPressed: () {
      //                   if (_formKey.currentState!.validate()) {
      //                     ScaffoldMessenger.of(context).showSnackBar(
      //                       SnackBar(content: Text('Processing Data')),
      //                     );
      //                   }
      //                 },
      //                 child: Text('Submit Request'),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),);
      //   },
      // child: Icon(Icons.add),
      // ),
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

