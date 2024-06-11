import 'dart:convert';

import 'package:blood_bank_app/base/base_service.dart';
import 'package:blood_bank_app/data/models/menu_item_response_model.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';

import '../../base/base_api_service.dart';
import '../../base/base_response_model.dart';

class MenuItemService extends BaseService<MenuItemResponseModel> {
  final apiEndPoint;
  MenuItemService({required this.apiEndPoint});
  BaseApiService baseApiService = BaseApiService();

  @override
  Future<MenuItemResponseModel> insertData(Object obj) async {
    try {
      await baseApiService.post(endpoint: apiEndPoint, data: obj, token: await getAuthToken());
      return MenuItemResponseModel();
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<MenuItemResponseModel> updateData(Object obj) {
    // TODO: implement updateData
    throw UnimplementedError();
  }

  @override
  Future<MenuItemResponseModel> deleteData(Object obj) async {
    try {
      await baseApiService.delete(endpoint: apiEndPoint, data: obj, token: await getAuthToken());
      return MenuItemResponseModel();
    } catch (e) {
      print(e);
      return MenuItemResponseModel();
    }
  }

  @override
  Future<MenuItemResponseModel> getAllData() async {
    try {
      MenuItemResponseModel responseModel = MenuItemResponseModel.fromJson(
          await baseApiService.get(
              endpoint: apiEndPoint, token: await getAuthToken()));
      return responseModel;
    } catch (e) {
      print(e);
      throw UnimplementedError();
    }
  }

  @override
  Future<BaseApiResponseModel> getDataById(String authToken) {
    // TODO: implement getDataById
    throw UnimplementedError();
  }

  Future<MenuItemResponseModel> getUserMenu() async {
    try {
      MenuItemResponseModel model = MenuItemResponseModel.fromJson(
          await baseApiService.get(
              endpoint: apiEndPoint, token: await getAuthToken()));
      return model;
    } catch (e) {
      throw UnimplementedError(e.toString());
    }
  }
}
