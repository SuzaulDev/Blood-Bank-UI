import 'package:blood_bank_app/base/base_service.dart';
import 'package:blood_bank_app/data/models/password_policy_response_model.dart';

import '../../base/base_api_service.dart';
import '../../utils/helper_funtion.dart';

class PasswordPolicyService extends BaseService<PasswordPolicyModel>{
  @override
  Future<PasswordPolicyModel> deleteData(Object obj) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<List<PasswordPolicyModel>> getAllData() async{
    try{
      BaseApiService baseApiService = BaseApiService();
      PasswordPolicyResponseModel model = PasswordPolicyResponseModel.fromJson(await baseApiService.get(endpoint:"api/privet/sya/password-policy",token: await getAuthToken()));
      return model.data!;
    }catch(e){
      return [];
    }
  }

  @override
  Future<PasswordPolicyModel> getDataById(int id) {
    // TODO: implement getDataById
    throw UnimplementedError();
  }

  @override
  Future<PasswordPolicyModel> insertData(Object obj) {
    // TODO: implement insertData
    throw UnimplementedError();
  }

  @override
  Future<PasswordPolicyModel> updateData(Object obj) {
    // TODO: implement updateData
    throw UnimplementedError();
  }


}