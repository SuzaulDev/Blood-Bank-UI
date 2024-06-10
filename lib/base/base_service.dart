 import 'package:blood_bank_app/base/base_response_model.dart';

abstract class BaseService<M>{
 Future<M> insertData(Object obj);
 Future<M> updateData(Object obj);
 Future<M> deleteData(Object obj);
 Future<M> getAllData();

 Future<BaseApiResponseModel> getDataById(String authToken);

}