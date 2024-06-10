import 'package:blood_bank_app/data/models/app_user_response_model.dart';
import 'package:blood_bank_app/data/models/blood_donor_response_model.dart';
import 'package:blood_bank_app/data/services/blood_donor_service.dart';
import 'package:blood_bank_app/data/services/blood_request_service.dart';
import 'package:blood_bank_app/data/services/menu_item_service.dart';
import 'package:blood_bank_app/data/services/password_policy_service.dart';
import 'package:blood_bank_app/data/services/user_role_assign_service.dart';
import 'package:blood_bank_app/data/services/user_role_service.dart';
import 'package:blood_bank_app/utils/constant_value.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/services/app_user_service.dart';
import 'home_page_event.dart';
import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  PasswordPolicyService policyService = PasswordPolicyService(apiEndPoint: "api/privet/sya/password-policy");
  MenuItemService menuItemService = MenuItemService(apiEndPoint: "api/privet/sya/menu-item");
  AppUserService appUserService = AppUserService(apiEndPoint: "api/privet/sya/app-user");
  UserRoleService userRoleService = UserRoleService(apiEndPoint: "api/privet/sya/user-role");
  UserRoleAssignService userRoleAssignService = UserRoleAssignService(apiEndPoint: "api/privet/sya/user-role-assign");
  BloodDonorService bloodDonorService = BloodDonorService(apiEndPoint: "api/privet/sya/donor");
  BloodRequestService bloodRequestService = BloodRequestService(apiEndpoint: "api/privet/sya/blood-request");

  HomePageBloc() : super(HomePageInitial()) {
    on<LoadHomePage>((event, emit) async {
      district.sort((a, b) => a.compareTo(b),);
      String token = await getAuthToken();
      int userTypeId = await getUserTypeId();
      emit(HomePageLoading());
      try {
        await getBloodGroupData();
        emit(
          HomePageLoaded(
            authToken: token,
            userTypeId: userTypeId,
            bloodDonorResponseModel: await bloodDonorService.getAllData(),
            bloodRequestModelList: await bloodRequestService.getCompletedBloodRequest(),
          ),
        );

      } catch (e) {
        print(e);
        emit(HomePageError(e.toString()));
      }
    });

    on<ShowDrawerMenuDetails>((event, emit) async {

      switch (event.menuUrl) {
        case "dashboard":
          await getBloodGroupData();
          emit(
            HomePageLoaded(
              authToken: await getAuthToken(),
              userTypeId: await getUserTypeId(),
              bloodDonorResponseModel: await bloodDonorService.getAllData(),
              bloodRequestModelList: await bloodRequestService.getCompletedBloodRequest(),
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
        case "blood-request":
          emit(BloodRequest(
            bloodDonorResponseModel: await bloodDonorService.getAllData(),
            cityList: district,
          ),
          );
          break;
        case "add-donor":
          emit(AddDonor(BloodDonorResponseModel:await bloodDonorService.getAllData(),passwordPolicyResponse: await policyService.getAllData() ));
          break;
        case "view-request":
          emit(ViewBloodRequest(bloodRequestList: await bloodRequestService.getDonorBloodRequest()));
          break;
        case "my-blood-request":
          emit(MyBloodRequest(receiverBloodRequest: await getAuthToken() != "null" ? await bloodRequestService.getReceiverBloodRequest() : []));
          break;
        case "blood-request-process":
          emit(ProcessingBloodRequest(bloodRequestResponseModel: await bloodRequestService.getAllData()));
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
      AppUserResponseModel model = await appUserService.insertData(event.appUserModel);
      emit(ApplicationUser(
          passwordPolicyResponse: await policyService.getAllData(),
          appUserResponse: await appUserService.getAllData()));
    });
    on<DeleteUser>((event, emit) async{
      await appUserService.deleteData(event.appUserModel).then((value) async =>
          emit(ApplicationUser(
            passwordPolicyResponse: await policyService.getAllData(),
            appUserResponse: await appUserService.getAllData(),
          ),),
      );
    });


    on<AddNewUserRole>((event, emit) async {
      await userRoleService.insertData(event.userRoleModel).then(
            (value) async => emit(UserRole(
                responseModel: await userRoleService.getAllData(),
                menuItemResponseModel: await menuItemService.getAllData())),
          );
    });
    on<DeleteUserRole>((event, emit) async {
      await userRoleService.deleteData(event.userRoleModel).then(
            (value) async => emit(
              UserRole(
                  responseModel: await userRoleService.getAllData(),
                  menuItemResponseModel: await menuItemService.getAllData()),
            ),
          );
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
    on<DeleteUserRoleAssign>((event, emit) async {
      await userRoleAssignService
          .deleteData(event.userRoleAssignModel)
          .then((value) async {
        emit(UserRoleAssign(
          appUserResponseModel: await appUserService.getAllData(),
          userRoleResponseModel: await userRoleService.getAllData(),
          userRoleAssignResponseModel: await userRoleAssignService.getAllData(),
        ));
      });
    });


    on<AddNewDonor>((event, emit)async {
      await bloodDonorService.insertData(event.donorInfoModel).then((value) async =>
          emit(AddDonor(BloodDonorResponseModel:await bloodDonorService.getAllData(),passwordPolicyResponse: await policyService.getAllData() )));
      });

    on<SendBloodRequest>((event, emit) async {
     await bloodRequestService.insertData(event.bloodRequestModel);
    });
    on<AcceptBloodRequestByDonor>((event, emit) async{
      await bloodRequestService.updateData(event.bloodRequestModel).then((value) async =>
          emit(ViewBloodRequest(bloodRequestList: await bloodRequestService.getDonorBloodRequest())) );
    });
    on<OnProcessingBloodRequest>((event, emit) async{
      await bloodRequestService.updateData(event.bloodRequestModel).then((value) async =>
          emit(MyBloodRequest(receiverBloodRequest: await getAuthToken() != "null" ? await bloodRequestService.getReceiverBloodRequest() : [])),  );
    });
    on<OnCompleteBloodRequest>((event, emit) async{
      print(event.bloodRequestModel.toJson());
      await bloodRequestService.updateData(event.bloodRequestModel).then((value) async =>
          emit(ProcessingBloodRequest(bloodRequestResponseModel: await bloodRequestService.getAllData())),  );
    });
    on<FilterByCityName>((event, emit) async{
      emit(BloodRequest(
        bloodDonorResponseModel: await bloodDonorService.filterByCityName(cityName: event.cityName),
        cityList: district,
      ),
      );
    });
    on<FilterByBloodGroup>((event, emit) async{
      emit(BloodRequest(
          bloodDonorResponseModel: await bloodDonorService.getDataByBloodGroup(Uri.encodeComponent(event.bloodGroup)),
        cityList: district,
      ),
      );
    });
    on<FilterByAllValue>((event, emit) async{
      emit(BloodRequest(
        bloodDonorResponseModel: await bloodDonorService.getAllData(),
        cityList: district,
      ),
      );
    });
    on<SearchFilter>((event, emit) async {
      emit(BloodRequest(
        searchedValue: event.value,
          bloodDonorResponseModel: await bloodDonorService.filterBySearchValue(value: event.value),
        cityList: district,
      ),
      );
    });

    ///..........................................................
    ///             this is for Bottom Navigation Control
    /// .........................................................

    on<ControlBottomNavigation>((event, emit) async{
      switch (event.indexNumber) {
        case 0:
          await getBloodGroupData();
          emit(HomePageLoaded(
            authToken: await getAuthToken(),
            userTypeId: await getUserTypeId(),
            bloodDonorResponseModel: await bloodDonorService.getAllData(),
            bloodRequestModelList: await bloodRequestService.getCompletedBloodRequest(),
          ));
          break;
        case 1:
          emit(FeedPage());
          break;
        case 2:
          emit(NearByDonor());
          break;
      }
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }

  Future<void> getBloodGroupData() async{
    for(int index = 0;index < bloodGroupTypeList.length;index++){
      BloodDonorResponseModel donorResponseModel = await bloodDonorService.getDataByBloodGroup(Uri.encodeComponent(bloodGroupTypeList[index].name));
      final list = donorResponseModel.data!.where((element) => element.donorInfoDto!.available!).toList();
      bloodGroupTypeList[index].amount = list.length;
    }
  }

}
