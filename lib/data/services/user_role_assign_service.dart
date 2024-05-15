import 'dart:convert';

import 'package:blood_bank_app/base/base_response_model.dart';
import 'package:blood_bank_app/base/base_service.dart';
import 'package:blood_bank_app/data/models/user_role_assign_model.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';

import '../../base/base_api_service.dart';

class UserRoleAssignService extends BaseService<UserRoleAssignResponseModel>{
  final apiEndPoint ;
  UserRoleAssignService({required this.apiEndPoint});
  BaseApiService baseApiService = BaseApiService();

  @override
  Future<UserRoleAssignResponseModel> insertData(Object obj) async {
    try{
      UserRoleAssignModel model = UserRoleAssignModel.fromJson(await baseApiService.post(endpoint: apiEndPoint, data: obj,token: await getAuthToken()));
      return UserRoleAssignResponseModel();
    }catch(e){
    throw UnimplementedError(e.toString());
    }

  }

  @override
  Future<UserRoleAssignResponseModel> updateData(Object obj) {
    // TODO: implement updateData
    throw UnimplementedError();
  }

  @override
  Future<UserRoleAssignResponseModel> deleteData(Object obj)async {
   try{
     final response = await baseApiService.delete(endpoint: apiEndPoint, data: obj,token: await getAuthToken());
      return UserRoleAssignResponseModel.fromJson(response);
   }catch(e){
     throw UnimplementedError(e.toString());
   }
  }

  @override
  Future<UserRoleAssignResponseModel> getAllData() async {
    try{
      final model = UserRoleAssignResponseModel.fromJson(await baseApiService.get(endpoint: apiEndPoint, token: await getAuthToken()));
    return model;
    }catch(e){
    throw UnimplementedError();
    }
  }

  @override
  Future<UserRoleAssignResponseModel> getDataById(int id) {
    // TODO: implement getDataById
    throw UnimplementedError();
  }


  
}