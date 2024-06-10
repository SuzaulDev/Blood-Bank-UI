import 'package:blood_bank_app/base/base_service.dart';
import 'package:blood_bank_app/data/models/user_role_response_model.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';

import '../../base/base_api_service.dart';
import '../../base/base_response_model.dart';

class UserRoleService extends BaseService<UserRoleResponseModel>{
  final apiEndPoint ;

  UserRoleService({required this.apiEndPoint});
  BaseApiService baseApiService = BaseApiService();

  @override
  Future<UserRoleResponseModel> getAllData() async {
    try{
      UserRoleResponseModel model = UserRoleResponseModel.fromJson(await baseApiService.get(endpoint: apiEndPoint, token: await getAuthToken()));
      return model;
    }catch(e){
      throw UnimplementedError();
    }
  }



  @override
  Future<UserRoleResponseModel> insertData(Object obj) async {
   try{
     await baseApiService.post(endpoint: apiEndPoint, data: obj,token: await getAuthToken());
     return UserRoleResponseModel();
   }
   catch(e){
     throw UnimplementedError(e.toString());
   }
  }

  @override
  Future<UserRoleResponseModel> updateData(Object obj) {
    // TODO: implement updateData
    throw UnimplementedError();
  }

  @override
  Future<UserRoleResponseModel> deleteData(Object obj) async{
    try{
      await baseApiService.delete(endpoint: apiEndPoint, data: obj,token: await getAuthToken());
      return UserRoleResponseModel();
    }
    catch(e){
      throw UnimplementedError(e.toString());
    }

  }

  @override
  Future<BaseApiResponseModel> getDataById(String authToken) {
    // TODO: implement getDataById
    throw UnimplementedError();
  }
}