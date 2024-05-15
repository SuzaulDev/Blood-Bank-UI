import 'package:blood_bank_app/bloc/login_bloc/login_page_event.dart';
import 'package:blood_bank_app/bloc/login_bloc/login_page_state.dart';
import 'package:blood_bank_app/data/services/auth_service.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


/// **Author**: Md. Sabbir Hossain
/// **Version**: 1.0.0
/// **Email**: sabbirr883@gmail.com
 class LoginPageBloc extends Bloc<LoginPageEvent,LoginPageState>{
  LoginPageBloc():super(LoginPageInitial()){
    on<LoadLoginPage>((event, emit) => emit(LoginPageInitial()) );
    AuthService authService = AuthService(apiEndPoint: "api/auth/signin");

    on<LoginOnClick>((event, emit) async {
      emit(LoginLoading());
      try{
        ///doing api calling
       final logInResponseModel = await authService.userLogin(event.loginRequestModel);
          if(logInResponseModel.status == true){
            setLoginDetails(loginResponseModel: logInResponseModel);
            print("login details seved");
            emit(LoginSuccess(logInResponseModel: logInResponseModel));
          }
      }catch(error)
      {
        print("this is your error $error");
        emit(LoginPageError(error: error.printError.toString()));
      }
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }

}


