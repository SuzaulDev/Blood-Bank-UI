import 'package:blood_bank_app/data/models/login_response_model.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// **Author**: Md. Sabbir Hossain
/// **Version**: 1.0.0
/// **Email**: sabbirr883@gmail.com
abstract class LoginPageState extends Equatable{}

class LoginPageInitial extends LoginPageState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class LoginLoading extends LoginPageState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class LoginSuccess extends LoginPageState{
  final LogInResponseModel logInResponseModel;
  LoginSuccess({required this.logInResponseModel});
  @override
  // TODO: implement props
  List<Object?> get props => [logInResponseModel];
}

class LoginPageError extends LoginPageState{
  final error;
  LoginPageError({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];

}