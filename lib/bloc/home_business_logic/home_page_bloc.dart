import 'package:blood_bank_app/utils/helper_funtion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../data/models/users_models.dart';
import '../../data/services/api_service.dart';
import 'home_page_event.dart';
import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final List<String> menuItemList = [
    "role",
    "user",
    "report",
    "role",
    "user",
    "report",
    "role",
    "user",
  ];
  ApiService apiService;

  List<UserModel> userModelList = [];

  HomePageBloc(this.apiService) : super(HomePageInitial()) {
    on<LoadHomePage>((event, emit) async {
      String token = await getAuthToken();
      int userTypeId = await getUserTypeId();
      emit(HomePageLoading());
      try {
        // Simulate loading data from a data source
        //await Future.delayed(Duration(seconds: 2));
        userModelList = await apiService.getData();
        emit(HomePageLoaded(
            userModelList: userModelList,
            authToken: token,
            userTypeId: userTypeId,
            menuItemList: menuItemList));
      } catch (e) {
        emit(HomePageError(e.printError.toString()));
      }
    });

    on<ShowDrawerMenuDetails>((event, emit) {
      switch (event.menuSerialNumber) {
        case 0:
          emit(ApplicationUser());
          break;
        case 1:
          emit(UserRole());
          break;
        case 2:
          emit(UserRoleAsign());
          break;
        case 3:
          emit(PasswordPOlicy());
          break;
        case 4:
          emit(MenuItem());
          break;
      }
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
}
