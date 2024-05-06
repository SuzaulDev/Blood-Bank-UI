import 'package:blood_bank_app/base/base_service.dart';
import 'package:blood_bank_app/data/models/menu_item_response_model.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';

import '../../base/base_api_service.dart';

class MenuItemService extends BaseService<MenuItemModel>{
  final apiEndPoint ;
  MenuItemService({required this.apiEndPoint});
  BaseApiService baseApiService = BaseApiService();


  @override
  Future<List<MenuItemModel>> getAllData() async{
    try{
     MenuItemResponseModel responseModel = MenuItemResponseModel.fromJson(await baseApiService.get(endpoint: apiEndPoint,token: await getAuthToken()));
     return responseModel.data!;
    }catch(e){
      print(e);
      throw UnimplementedError();
    }
  }

  @override
  Future<MenuItemModel> getDataById(int id) {
    // TODO: implement getDataById
    throw UnimplementedError();
  }

  @override
  Future<MenuItemModel> insertData(Object obj)async {
    try{
      MenuItemModel model = MenuItemModel.fromJson(await baseApiService.post(endpoint: apiEndPoint,data: obj,token: await getAuthToken()));
      return model;
    }catch(e){
      throw UnimplementedError();
    }
  }

  @override
  Future<MenuItemModel> updateData(Object obj) {
    // TODO: implement updateData
    throw UnimplementedError();
  }


  @override
  Future<MenuItemModel> deleteData(Object obj) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }


  
}