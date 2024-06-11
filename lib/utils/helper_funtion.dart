import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/models/login_response_model.dart';
import 'const/AppConstant.dart';

String getFormattedDate(DateTime dateTime, String pattern) {
  return DateFormat(pattern).format(dateTime);
}

String globalAuthToken = "";
bool isLocationGranted = false;
Position? currentPosition;

/// for set authtoken after login
void setLoginDetails({required LogInResponseModel loginResponseModel}) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString(
      AUTH_TOKEN_KEY, loginResponseModel.data!.accessToken.toString());
  preferences.setInt(USER_TYPE_ID_KEY, loginResponseModel.data!.userTypeId!);
  preferences.setString(
      USER_TYPE_NAME_KEY, loginResponseModel.data!.userTypeName!);
}

/// for getting login details on shared-preferences
Future<String> getAuthToken() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String token = preferences.getString(AUTH_TOKEN_KEY).toString();
  if (token != "") {
    globalAuthToken = token;
  }
  return globalAuthToken;
}

Future<int> getUserTypeId() async {
  int userTypeId = 9;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  int? userType = preferences.getInt(USER_TYPE_ID_KEY);
  if (userType != null) {
    userTypeId = userType;
  }
  return userTypeId;
}

Future<String> getUserTypeName() async {
  String userTypeName = "";
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? getUserTypeName = preferences.getString(USER_TYPE_NAME_KEY);
  if (getUserTypeName != null) {
    userTypeName = getUserTypeName;
  }
  return userTypeName;
}

// Method to format date
String formatDate({required String format,required DateTime date}) {
  final DateFormat formatter = DateFormat(format);
  return formatter.format(date);
}

// Method to format time
String formatTime({required String format,required DateTime time}) {
  final DateFormat formatter = DateFormat(format);
  return formatter.format(time);
}

// Method to format both date and time
String formatDateTime({required String format,required DateTime dateTime}) {
  final DateFormat formatter = DateFormat(format);
  return formatter.format(dateTime);
}

// Method to format date with custom pattern
String formatCustomDate(DateTime date, String pattern) {
  final DateFormat formatter = DateFormat(pattern);
  return formatter.format(date);
}

/// for location permission
Future<void> checkLocationPermission(BuildContext context) async {
  currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  print("this is my location: "+currentPosition.toString());
  var status = await Permission.location.status;
  if (status.isDenied || status.isRestricted) {
    // Request permission
    status = await Permission.location.request();
    if (status.isGranted) {
        isLocationGranted = true;
        currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    } else {
      _showPermissionDeniedDialog(context: context);
    }
  } else {
      isLocationGranted = true;
  }
}

void _showPermissionDeniedDialog({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Location Permission'),
        content: Text('Location permission is required to use this feature. Please grant the permission.'),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void logOut() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.remove(AUTH_TOKEN_KEY);
  preferences.remove(USER_TYPE_ID_KEY);
  preferences.remove(USER_TYPE_NAME_KEY);
}

/// for Filtering Response Data From Server
