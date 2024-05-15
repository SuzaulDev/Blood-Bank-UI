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
  Future<AppUserResponseModel> getDataById(int id) {
    // TODO: implement getDataById
    throw UnimplementedError();
  }

  @override
  Future<AppUserResponseModel> insertData(Object obj) async {
    try{
      AppUserResponseModel appUserRes = AppUserResponseModel.fromJson( await baseApiService.post(endpoint: apiEndPoint, data: obj,token: await getAuthToken()));
      return appUserRes;
    }catch(e){
      throw UnimplementedError();
    }
  }

  @override
  Future<AppUserResponseModel> updateData(Object obj) {
    // TODO: implement updateData
    throw UnimplementedError();
  }
  @override
  Future<AppUserResponseModel> deleteData(Object obj) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

}