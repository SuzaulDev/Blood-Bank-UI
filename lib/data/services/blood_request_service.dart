import 'dart:io';

import 'package:blood_bank_app/base/base_api_service.dart';
import 'package:blood_bank_app/base/base_response_model.dart';
import 'package:blood_bank_app/base/base_service.dart';
import 'package:blood_bank_app/data/models/blood_request_response_model.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';

class BloodRequestService extends BaseService<BloodRequestResponseModel>{
  final String apiEndpoint;
  BloodRequestService({required this.apiEndpoint});
  BaseApiService baseApiService = BaseApiService();


  @override
  Future<BloodRequestResponseModel> insertData(Object obj) async{
    try{
      await baseApiService.post(endpoint: apiEndpoint, data: obj,token: await getAuthToken());
      return BloodRequestResponseModel();
    }catch(e){
      print(e.toString());
      throw HttpException(e.toString());
    }
  }

  @override
  Future<BloodRequestResponseModel> updateData(Object obj) async {
    try{
      print(obj);
      final rsModel =  await baseApiService.put(endpoint: apiEndpoint+"/update-status", data: obj,token: await getAuthToken());
      print(rsModel);
      return BloodRequestResponseModel();
    }catch(e){
      print(e);
      throw HttpException(e.toString());
    }
  }

  @override
  Future<BloodRequestResponseModel> deleteData(Object obj) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<BloodRequestResponseModel> getAllData() async{
    try{
      BloodRequestResponseModel bloodRequestResponseModel = BloodRequestResponseModel.fromJson(await baseApiService.get(endpoint: apiEndpoint,token: await getAuthToken()));
    return bloodRequestResponseModel;
    }catch(e){
      print(e.toString());
      throw HttpException(e.toString());
    }
  }


  @override
  Future<BaseApiResponseModel> getDataById(String authToken) async {
   throw UnimplementedError();
  }

  Future<List<BloodRequestModel>> getDonorBloodRequest()async{
    try{
      BloodRequestResponseModel bloodRequestResponseModel = BloodRequestResponseModel.fromJson(await baseApiService.get(endpoint: apiEndpoint+"/donor-request",token: await getAuthToken()));
      // BaseResponseModel baseResponseModel = BaseResponseModel.fromJson(await baseApiService.get(endpoint: apiEndpoint+"/donor-request",token: await getAuthToken()));
      // print(baseResponseModel.data);
      return bloodRequestResponseModel.data!;
    }
    catch(e){
      print(e.toString());
      throw HttpException(e.toString());
    }
  }

  Future<List<BloodRequestModel>> getReceiverBloodRequest()async{
    try{
      BloodRequestResponseModel bloodRequestResponseModel = BloodRequestResponseModel.fromJson(await baseApiService.get(endpoint: apiEndpoint+"/receiver-request",token: await getAuthToken()));
      return bloodRequestResponseModel.data!;
    }
    catch(e){
      print(e.toString());
      throw HttpException(e.toString());
    }
  }

  Future<List<BloodRequestModel>> getCompletedBloodRequest()async{
    try{
      BloodRequestResponseModel bloodRequestResponseModel = BloodRequestResponseModel.fromJson(await baseApiService.get(endpoint: apiEndpoint+"/completed-request"));
      return bloodRequestResponseModel.data!;
    }
    catch(e){
      print(e.toString());
      throw HttpException(e.toString());
    }
  }


}