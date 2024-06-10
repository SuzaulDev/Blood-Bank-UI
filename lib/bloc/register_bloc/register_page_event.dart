import 'package:equatable/equatable.dart';

import '../../data/models/register_request_model.dart';

abstract class RegisterPageEvent extends Equatable{}

class LoadRegisterPage extends RegisterPageEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class RegisterOnClick extends RegisterPageEvent{
  RegisterRequestModel registerRequestModel;
  RegisterOnClick({required this.registerRequestModel});

  @override
  // TODO: implement props
  List<Object?> get props => [];

}