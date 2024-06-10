import 'package:blood_bank_app/bloc/drawer_bloc/drawer_event.dart';
import 'package:blood_bank_app/bloc/drawer_bloc/drawer_state.dart';
import 'package:blood_bank_app/data/models/menu_item_response_model.dart';
import 'package:blood_bank_app/data/services/menu_item_service.dart';
import 'package:blood_bank_app/utils/constant_value.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/helper_funtion.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  MenuItemService menuItemService = MenuItemService(apiEndPoint: "api/privet/sya/menu-item/menu-by-app-user-id");
  DrawerBloc() : super(DrawerInitial()) {
    on<LoadDrawer>((event, emit) async {
      emit(DrawerLoading());
      int userTypeId = await getUserTypeId();
      String userTypeName = await getUserTypeName();
      MenuItemResponseModel model = await menuItemService.getUserMenu();
      if (model.status == true) {
        emit(DrawerSuccess(UserTypeName: userTypeName ,userTypeId: userTypeId, menuItemList: model.data!));
      } else {
        emit(DrawerSuccess(userTypeId: 4, menuItemList: []));
      }
    });
  }
}
