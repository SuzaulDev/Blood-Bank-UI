import 'package:blood_bank_app/base/base_service.dart';
import 'package:blood_bank_app/data/models/password_policy_response_model.dart';

import '../../base/base_api_service.dart';
import '../../utils/helper_funtion.dart';

class PasswordPolicyService extends BaseService<PasswordPolicyResponseModel>{
  final apiEndPoint;
  PasswordPolicyService({required this.apiEndPoint});

  @override
  Future<PasswordPolicyResponseModel> deleteData(Object obj) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<PasswordPolicyResponseModel> getAllData() async{
    try{
      BaseApiService baseApiService = BaseApiService();
      PasswordPolicyResponseModel model = PasswordPolicyResponseModel.fromJson(await baseApiService.get(endpoint:apiEndPoint,token: await getAuthToken()));
      return model;
    }catch(e){
      return PasswordPolicyResponseModel();
    }
  }

  @override
  Future<PasswordPolicyResponseModel> getDataById(int id) {
    // TODO: implement getDataById
    throw UnimplementedError();
  }

  @override
  Future<PasswordPolicyResponseModel> insertData(Object obj) {
    // TODO: implement insertData
    throw UnimplementedError();
  }

  @override
  Future<PasswordPolicyResponseModel> updateData(Object obj) {
    // TODO: implement updateData
    throw UnimplementedError();
  }


}