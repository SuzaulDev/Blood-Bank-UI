import 'dart:io';

import 'package:blood_bank_app/base/base_api_service.dart';
import 'package:blood_bank_app/base/base_service.dart';
import 'package:blood_bank_app/data/models/blood_donor_response_model.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';

import '../../base/base_response_model.dart';

class BloodDonorService extends BaseService<BloodDonorResponseModel>{
  final apiEndPoint;
  BloodDonorService({required this.apiEndPoint});

  BaseApiService baseApiService = BaseApiService();
  @override
  Future<BloodDonorResponseModel> insertData(Object obj) async{
    try{
      await baseApiService.post(endpoint: apiEndPoint, data: obj,token: await getAuthToken());
      return BloodDonorResponseModel();
    }catch(e){
      print(e.toString());
      throw HttpException(e.toString());
    }
  }

  @override
  Future<BloodDonorResponseModel> updateData(Object obj) {
    // TODO: implement updateData
    throw UnimplementedError();
  }

  @override
  Future<BloodDonorResponseModel> deleteData(Object obj) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<BloodDonorResponseModel> getAllData() async {
    try{
      BloodDonorResponseModel model = BloodDonorResponseModel.fromJson(await baseApiService.get(endpoint: apiEndPoint,));
      return model;
    }
    catch(e){
      throw HttpException(e.toString());
    }
  }
  Future<BloodDonorResponseModel> filterByCityName({required String cityName}) async {
    try{
      BloodDonorResponseModel model = BloodDonorResponseModel.fromJson(await baseApiService.get(endpoint: "$apiEndPoint/get-by-city/$cityName",));
      return model;
    }
    catch(e){
      throw HttpException(e.toString());
    }
  }
  Future<BloodDonorResponseModel> filterBySearchValue({required String value}) async {
    try{
      BloodDonorResponseModel model = BloodDonorResponseModel.fromJson(await baseApiService.get(endpoint: "$apiEndPoint/search-donor/$value",));
      return model;
    }
    catch(e){
      throw HttpException(e.toString());
    }
  }

  @override
  Future<BaseApiResponseModel> getDataById(String authToken) {
    // TODO: implement getDataById
    throw UnimplementedError();
  }

  Future<BloodDonorResponseModel> getDataByBloodGroup(String bloodGroup) async{
   BloodDonorResponseModel model = BloodDonorResponseModel.fromJson(await baseApiService.get(endpoint: apiEndPoint+"/get-by-blood-group/{blood-group}?bloodGroup=$bloodGroup"));
   return model;
  }

}