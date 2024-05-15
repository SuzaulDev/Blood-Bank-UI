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
  // Future<LogInResponseModel> userRegistration({
  //   required String displayName,required String username,required String password})
  // async{
  //   try{
  //     var url = Uri.parse("${localUrl}api/auth/signup");
  //     final response = await http.post(url,
  //       headers:<String, String> {
  //         'Content-Type': 'application/json; charset=UTF-8'
  //       } ,
  //       body: json.encode(<String, String>{
  //         'displayName': displayName,
  //         'username': username,
  //         'password': password
  //       }),
  //     );
  //     if(response.statusCode == 200){
  //       rData = LogInResponseModel.fromJson( json.decode(response.body) as Map<String,dynamic> );
  //     }
  //     else{
  //       throw Exception();
  //     }
  //   }
  //   catch(error){
  //
  //   }
  //   return  rData;
  // }

}