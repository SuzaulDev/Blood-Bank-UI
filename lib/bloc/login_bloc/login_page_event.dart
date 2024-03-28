import 'package:equatable/equatable.dart';

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
  final String username;
  final String password;
  LoginOnClick({required  this.username,required  this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

