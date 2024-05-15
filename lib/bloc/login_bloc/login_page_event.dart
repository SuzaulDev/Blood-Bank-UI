import 'package:equatable/equatable.dart';

import '../../data/models/login_request_model.dart';

/// **Author**: Md. Sabbir Hossain
/// **Version**: 1.0.0
/// **Email**: sabbirr883@gmail.com
abstract class LoginPageEvent extends Equatable{}

class LoadLoginPage extends LoginPageEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class LoginOnClick extends LoginPageEvent{
  final LoginRequestModel loginRequestModel;
  LoginOnClick({required this.loginRequestModel});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

