import 'package:equatable/equatable.dart';

abstract class RegisterPageEvent extends Equatable{}

class LoadRegisterPage extends RegisterPageEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class RegisterOnClick extends RegisterPageEvent{
  final String displayName;
  final String username;
  final String password;
  RegisterOnClick({required this.displayName, required this.username,required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [];

}