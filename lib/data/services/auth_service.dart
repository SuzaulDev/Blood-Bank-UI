import 'dart:convert';
import 'dart:io';

import 'package:blood_bank_app/base/base_api_service.dart';
import 'package:get/get.dart';

import '../models/login_response_model.dart';

class AuthService {
  final apiEndPoint ;
  AuthService({required this.apiEndPoint});

  BaseApiService baseApiService = BaseApiService();
  Future<LogInResponseModel> userLogin(Object obj) async {
    try {
      final data = LogInResponseModel.fromJson(await baseApiService.post(endpoint: apiEndPoint, data: obj) );
       return data;
    } catch (error) {
      print(error.printError);
      throw Exception(error);
    }
  }
  Future<LogInResponseModel> userRegistration({required Object registrationModel})
  async{
    try{
      final data = LogInResponseModel.fromJson(await baseApiService.post(endpoint: apiEndPoint, data: registrationModel) );
      return data;
    }
    catch(error){
      print(error.printError);
      throw Exception(error);
    }
  }

}