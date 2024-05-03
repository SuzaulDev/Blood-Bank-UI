import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../utils/constant_value.dart';
import '../../utils/helper_funtion.dart';
import '../../utils/my_custom_clipper_for_app_bar.dart';


class DonarRegPage extends StatelessWidget {
  const DonarRegPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final mobileController = TextEditingController();
    final areaController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    bool _isObscure = true;
    String? selectedBloodGroupType;
    DateTime? dateOfBirth;
    DateTime? lastDonationDate;
    String? imagePath;
    int? id;
    bool? status;
    bool termsAndCondition = false;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          centerTitle: true,
          title: const Text(
            'Create Your Account*',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: ClipPath(
            clipper: MyCustomClipperForAppBar(),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.red.shade700,
                      Colors.red.shade200,
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    tileMode: TileMode.clamp,
                  )),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          hintText: 'Enter your name',
                          labelText: 'Enter your name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 1))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field must not be empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: mobileController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone),
                          labelText: 'Enter your Phone number',
                          hintText: 'Enter your Phone number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 1))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field must not be empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          hintText: 'Enter your email',
                          labelText: 'Enter your email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 1))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field must not be empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: _isObscure,
                      controller: passwordController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.password),
                          labelText: 'Enter your password',
                          hintText: 'Enter your password',
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                //TODO: wil do something
                              }),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 1,
                              ))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field must not be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.bloodtype),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1))),
                        hint: const Text('Select Your Blood Group'),
                        items: bloodGroupType
                            .map((e) =>
                            DropdownMenuItem(value: e, child: Text(e!)))
                            .toList(),
                        value: selectedBloodGroupType,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a type';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          //TODO: Will do sometings
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            selectDate(context);
                          },
                          icon: const Icon(Icons.calendar_month),
                          label: const Text('Select Date of Birth'),
                        ),
                        Text(dateOfBirth == null
                            ? 'No date chosen'
                            : getFormattedDate(dateOfBirth!, 'dd/MM/yyyy'))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            selectLastDonationDate(context);
                          },
                          icon: const Icon(Icons.calendar_month),
                          label: const Text('Select Last Donation Date'),
                        ),
                        Text(lastDonationDate == null
                            ? 'No date chosen'
                            : getFormattedDate(lastDonationDate!, 'dd/MM/yyyy'))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: areaController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.add_location),
                          hintText: 'Enter your area',
                          labelText: 'Enter your area',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 1))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field must not be empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        imagePath == null
                            ? const Icon(
                          Icons.movie,
                          size: 100,
                        )
                            : Image.file(
                          File(imagePath!),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        TextButton.icon(
                          onPressed: getImage,
                          icon: const Icon(Icons.photo),
                          label: const Text('Select from Gallery'),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: termsAndCondition,
                          onChanged: (bool? value) {
                            //TODO:will do something
                          }),
                      const Text('I agree to the '),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Terms and Conditions'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                        minimumSize: const Size(150, 35),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                      ),
                      onPressed: () {

                       // Navigator.pushReplacementNamed(context, DonorListPage.routeName);
                      },
                      child: const Text('Sign Up'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                      child: Text(
                        'Already have an account?',
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        backgroundColor: Colors.white,
                        minimumSize: const Size(150, 35),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                      ),
                      onPressed: () {
                        //TODO: will do something
                       // Navigator.pushNamed(context, LoginPage.routeName);
                      },
                      child: const Text('Sign In from here'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
        ),
      ),
    );
  }



  void selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {

    }
  }
  void selectLastDonationDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {

    }
  }
  void getImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {

    }
  }









}
