import 'package:blood_bank_app/base/base_response_model.dart';
import 'package:blood_bank_app/bloc/my_profile_bloc/my_profile_event.dart';
import 'package:blood_bank_app/bloc/my_profile_bloc/my_profile_state.dart';
import 'package:blood_bank_app/data/models/app_user_response_model.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/app_user_service.dart';
import '../../data/services/blood_donor_service.dart';

class MyProfileBloc extends Bloc<MyProfileEvent,MyProfileState>{
  AppUserService appUserService = AppUserService(apiEndPoint: "api/privet/sya/app-user");
  BloodDonorService bloodDonorService = BloodDonorService(apiEndPoint: "api/privet/sya/donor");
  MyProfileBloc():super(MyProfileInit()){
    on<LoadMyProfile>((event, emit)async {
    BaseApiResponseModel response =  await appUserService.getDataById(await getAuthToken());
    emit(MyProfileSuccess(appUserModel: response.data));

    } );
  }

}