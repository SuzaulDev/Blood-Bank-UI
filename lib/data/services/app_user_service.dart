import 'dart:io';

import 'package:blood_bank_app/base/base_response_model.dart';
import 'package:blood_bank_app/base/base_service.dart';
import 'package:blood_bank_app/data/models/app_user_response_model.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';

import '../../base/base_api_service.dart';

class AppUserService extends BaseService<AppUserResponseModel>{
  final apiEndPoint ;
  AppUserService({required this.apiEndPoint});
  BaseApiService baseApiService = BaseApiService();



  @override
  Future<AppUserResponseModel> getAllData() async{
    try{
      AppUserResponseModel model = AppUserResponseModel.fromJson(await baseApiService.get(endpoint: apiEndPoint,token: await getAuthToken()));
      return model;
    }catch(e){
    throw UnimplementedError();
    }
  }

  @override
  Future<AppUserResponseModel> insertData(Object obj) async {
    try{
      await baseApiService.post(endpoint: apiEndPoint, data: obj,token: await getAuthToken());
      return AppUserResponseModel();
    }catch(e){
      print(e);
      throw HttpException(e.toString());
    }
  }

  @override
  Future<AppUserResponseModel> updateData(Object obj) {
    // TODO: implement updateData
    throw UnimplementedError();
  }
  @override
  Future<AppUserResponseModel> deleteData(Object obj) async{
    try{
      await baseApiService.delete(endpoint: apiEndPoint, data: obj,token: await getAuthToken());
      return AppUserResponseModel();
    }catch(e){
      throw HttpException(e.toString());
    }
  }


  @override
  Future<BaseApiResponseModel> getDataById(String authToken) async {
    try{
      BaseApiResponseModel baseApiResponseModel =  BaseApiResponseModel<AppUserModel>.fromJson(await baseApiService.get(endpoint:apiEndPoint+"/my-profile",token: authToken), (json) => AppUserModel.fromJson(json as Map<String, dynamic>));
      return baseApiResponseModel;
    }
    catch(e){
      print(e.toString());
      throw HttpException(e.toString());
    }
  }

}