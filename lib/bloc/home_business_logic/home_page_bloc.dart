import 'package:blood_bank_app/data/models/menu_item_response_model.dart';
import 'package:blood_bank_app/data/models/password_policy_response_model.dart';
import 'package:blood_bank_app/data/models/app_user_response_model.dart';
import 'package:blood_bank_app/data/services/menu_item_service.dart';
import 'package:blood_bank_app/data/services/password_policy_service.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../data/models/users_models.dart';
import '../../data/services/api_service.dart';
import '../../data/services/app_user_service.dart';
import 'home_page_event.dart';
import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  ApiService apiService;
  PasswordPolicyService policyService = PasswordPolicyService();
  MenuItemService menuItemService = MenuItemService(apiEndPoint: "api/privet/sya/menu-item");
  AppUserService appUserService = AppUserService(apiEndPoint: "api/privet/sya/app-user");

  HomePageBloc(this.apiService) : super(HomePageInitial()) {
    on<LoadHomePage>((event, emit) async {
      String token = await getAuthToken();
      int userTypeId = await getUserTypeId();
      emit(HomePageLoading());
      try {
        emit(HomePageLoaded(
            userModelList:[], //await apiService.getData(),
            authToken: token,
            userTypeId: userTypeId,
            menuItemList: await menuItemService.getAllData()));
      } catch (e) {
        emit(HomePageError(e.printError.toString()));
      }
    });

    on<ShowDrawerMenuDetails>((event, emit) async{
      switch (event.menuSerialNumber) {
        case 0:
          emit(ApplicationUser(passwordPolicylist: await policyService.getAllData(),appUserList: await appUserService.getAllData()));
          break;
        case 1:
          emit(UserRole());
          break;
        case 2:
          emit(UserRoleAsign());
          break;
        case 3:
          emit(PasswordPolicy(passwordPolicyList: await policyService.getAllData()));
          break;
        case 4:
          emit(MenuItem(menuItemList: await menuItemService.getAllData()));
          break;
      }
    });
    on<AddNewMenu>((event, emit) async{
      final msg = await menuItemService.insertData(event.menuItem).
      then((value) async =>emit(MenuItem(menuItemList: await menuItemService.getAllData())) );

    } );
    on<AddNewUser>((event, emit) async{
      AppUserModel model = await appUserService.insertData(event.appUserModel);
      emit(ApplicationUser(passwordPolicylist: await policyService.getAllData(),appUserList: await appUserService.getAllData()));
      
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }





}
