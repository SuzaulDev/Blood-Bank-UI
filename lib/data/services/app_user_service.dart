import 'package:blood_bank_app/base/base_service.dart';
import 'package:blood_bank_app/data/models/app_user_response_model.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';

import '../../base/base_api_service.dart';

class AppUserService extends BaseService<AppUserModel>{
  final apiEndPoint ;
  AppUserService({required this.apiEndPoint});
  BaseApiService baseApiService = BaseApiService();



  @override
  Future<List<AppUserModel>> getAllData() async{
    try{
      AppUserResponseModel model = AppUserResponseModel.fromJson(await baseApiService.get(endpoint: apiEndPoint,token: await getAuthToken()));
      return model.data!;
    }catch(e){
    throw UnimplementedError();
    }
  }

  @override
  Future<AppUserModel> getDataById(int id) {
    // TODO: implement getDataById
    throw UnimplementedError();
  }

  @override
  Future<AppUserModel> insertData(Object obj) async {
    try{
      AppUserModel appUser = AppUserModel.fromJson( await baseApiService.post(endpoint: apiEndPoint, data: obj,token: await getAuthToken()));
      return appUser;
    }catch(e){
      throw UnimplementedError();
    }
  }

  @override
  Future<AppUserModel> updateData(Object obj) {
    // TODO: implement updateData
    throw UnimplementedError();
  }
  @override
  Future<AppUserModel> deleteData(Object obj) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

}