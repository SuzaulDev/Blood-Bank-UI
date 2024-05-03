import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/home_business_logic/home_page_state.dart';
import '../data/models/login_response_model.dart';
import 'const/AppConstant.dart';

String getFormattedDate(DateTime dateTime, String pattern) {
  return DateFormat(pattern).format(dateTime);
}


/// for set authtoken after login
void setLoginDetails({required LogInResponseModel loginResponseModel}) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString(AUTH_TOKEN_KEY, loginResponseModel.data!.accessToken.toString());
  preferences.setInt(USER_TYPE_ID_KEY, loginResponseModel.data!.userTypeId!);
}
/// for getting login details on shared-preferences
Future<String> getAuthToken() async{
  String authToken ="";
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String token = preferences.getString(AUTH_TOKEN_KEY).toString();
  if(token != ""){
    authToken = token;
  }
 // print(authToken);
  return authToken;
}
Future<int> getUserTypeId() async{
   int userTypeId = 0;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  int? userType = preferences.getInt(USER_TYPE_ID_KEY);
  if(userType != null){
    userTypeId = userType;
  }


  return userTypeId;
}

void logOut()async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.remove(AUTH_TOKEN_KEY);
  preferences.remove(USER_TYPE_ID_KEY);
}




