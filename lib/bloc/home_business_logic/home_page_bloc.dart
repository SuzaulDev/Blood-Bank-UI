import 'package:blood_bank_app/data/models/app_user_response_model.dart';
import 'package:blood_bank_app/data/services/menu_item_service.dart';
import 'package:blood_bank_app/data/services/password_policy_service.dart';
import 'package:blood_bank_app/data/services/user_role_assign_service.dart';
import 'package:blood_bank_app/data/services/user_role_service.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../data/services/app_user_service.dart';
import 'home_page_event.dart';
import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  PasswordPolicyService policyService = PasswordPolicyService(apiEndPoint: "api/privet/sya/password-policy");
  MenuItemService menuItemService = MenuItemService(apiEndPoint: "api/privet/sya/menu-item");
  AppUserService appUserService = AppUserService(apiEndPoint: "api/privet/sya/app-user");
  UserRoleService userRoleService = UserRoleService(apiEndPoint: "api/privet/sya/user-role");
  UserRoleAssignService userRoleAssignService = UserRoleAssignService(apiEndPoint: "api/privet/sya/user-role-assign");

  HomePageBloc() : super(HomePageInitial()) {
    on<LoadHomePage>((event, emit) async {
      String token = await getAuthToken();
      int userTypeId = await getUserTypeId();
      emit(HomePageLoading());
      try {
        emit(
          HomePageLoaded(
            userModelList: [], //await apiService.getData(),
            authToken: token,
            userTypeId: userTypeId,
            menuItemResponse: await menuItemService.getAllData(),
          ),
        );
      } catch (e) {
        emit(HomePageError(e.printError.toString()));
      }
    });

    on<ShowDrawerMenuDetails>((event, emit) async {
      switch (event.menuUrl) {
        case "dashboard":
          emit(
            HomePageLoaded(
              userModelList: [],
              authToken: await getAuthToken(),
              userTypeId: await getUserTypeId(),
              menuItemResponse: await menuItemService.getAllData(),
            ),
          );
        case "app-user":
          emit(
            ApplicationUser(
              passwordPolicyResponse: await policyService.getAllData(),
              appUserResponse: await appUserService.getAllData(),
            ),
          );
          break;
        case "user-role":
          emit(UserRole(
              responseModel: await userRoleService.getAllData(),
              menuItemResponseModel: await menuItemService.getAllData()));
          break;
        case "user-role-assign":
          emit(UserRoleAssign(
            appUserResponseModel: await appUserService.getAllData(),
            userRoleResponseModel: await userRoleService.getAllData(),
            userRoleAssignResponseModel:
                await userRoleAssignService.getAllData(),
          ));
          break;
        case "password-policy":
          emit(PasswordPolicy(
            passwordPolicyResponse: await policyService.getAllData(),
          ));
          break;
        case "menu-item":
          emit(MenuItem(menuItemResponse: await menuItemService.getAllData()));
          break;
      }
    });
    on<AddNewMenu>((event, emit) async {
      await menuItemService.insertData(event.menuItem).then((value) async =>
          emit(MenuItem(menuItemResponse: await menuItemService.getAllData())));
    });
    on<DeleteMenu>((event, emit) async {
      await menuItemService
          .deleteData(
            event.menuItem,
          )
          .then((value) async => emit(
                MenuItem(
                  menuItemResponse: await menuItemService.getAllData(),
                ),
              ));
    });
    on<AddNewUser>((event, emit) async {
      AppUserResponseModel model =
          await appUserService.insertData(event.appUserModel);
      emit(ApplicationUser(
          passwordPolicyResponse: await policyService.getAllData(),
          appUserResponse: await appUserService.getAllData()));
    });
    on<SetUserRole>((event, emit) async {
      await userRoleAssignService
          .insertData(event.userRoleAssignModel)
          .then((value) async {
        emit(UserRoleAssign(
          appUserResponseModel: await appUserService.getAllData(),
          userRoleResponseModel: await userRoleService.getAllData(),
          userRoleAssignResponseModel: await userRoleAssignService.getAllData(),
        ));
      });
    });
    on<AddNewUserRole>((event, emit) async {
      await userRoleService.insertData(event.userRoleModel).then(
          (value) async => emit(UserRole(
              responseModel: await userRoleService.getAllData(),
              menuItemResponseModel: await menuItemService.getAllData())),
      );
    });
    on<DeleteUserRole>((event, emit)async {
      await userRoleService.deleteData(event.userRoleModel).then((value)async =>
          emit(UserRole(
              responseModel: await userRoleService.getAllData(),
              menuItemResponseModel: await menuItemService.getAllData()
          ),
          ),
      );
    });

    on<DeleteUserRoleAssign>((event, emit) async {
      await userRoleAssignService.deleteData(event.userRoleAssignModel).then((value) async {
        emit(UserRoleAssign(
          appUserResponseModel: await appUserService.getAllData(),
          userRoleResponseModel: await userRoleService.getAllData(),
          userRoleAssignResponseModel: await userRoleAssignService.getAllData(),
        ));
      });
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
}
