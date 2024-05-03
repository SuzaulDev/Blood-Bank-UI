import 'package:blood_bank_app/bloc/register_bloc/register_page_event.dart';
import 'package:blood_bank_app/bloc/register_bloc/register_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/api_service.dart';
import '../../utils/helper_funtion.dart';

class RegisterPageBloc extends Bloc<RegisterPageEvent,RegisterPageState>{
  final ApiService apiService;
  RegisterPageBloc({required this.apiService}):super(RegisterPageInitial()){
    on<LoadRegisterPage>((event, emit) => emit(RegisterPageInitial()));
    on<RegisterOnClick>((event, emit) async{
      emit(RegisterPageLoading());
      try{
        ///doing api calling
        final logInResponseModel = await apiService.userRegistration(displayName: event.displayName, username: event.username, password: event.password);
        if(logInResponseModel.status == true){
          setLoginDetails(loginResponseModel: logInResponseModel);
          print("login details seved");
          emit(RegisterSuccess(logInResponseModel: logInResponseModel));
        }
      }catch(error)
      {
        print("this is your error $error");
        emit(RegisterPageError(error: error.toString()));
      }
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }

}