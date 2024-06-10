import 'package:blood_bank_app/bloc/register_bloc/register_page_event.dart';
import 'package:blood_bank_app/bloc/register_bloc/register_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/services/auth_service.dart';
import '../../utils/helper_funtion.dart';

class RegisterPageBloc extends Bloc<RegisterPageEvent,RegisterPageState>{
  AuthService authService = AuthService(apiEndPoint: "api/auth/signup");
  RegisterPageBloc():super(RegisterPageInitial()){
    on<LoadRegisterPage>((event, emit) => emit(RegisterPageInitial()));
    on<RegisterOnClick>((event, emit) async{
      emit(RegisterPageLoading());
      try{
        final logInResponseModel = await authService.userRegistration(registrationModel: event.registerRequestModel);
        if(logInResponseModel.status == true){
          Future.delayed(
              Duration(milliseconds: logInResponseModel.data!.loginExpierDuration!),
                  (){
                logOut();
              }
          );


          setLoginDetails(loginResponseModel: logInResponseModel);
          emit(RegisterSuccess(logInResponseModel: logInResponseModel));
        }
        else{
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