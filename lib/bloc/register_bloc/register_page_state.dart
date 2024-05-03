import 'package:equatable/equatable.dart';

import '../../data/models/login_response_model.dart';

abstract class RegisterPageState extends Equatable{}

class RegisterPageInitial extends RegisterPageState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class RegisterPageLoading extends RegisterPageState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class RegisterSuccess extends RegisterPageState{
  final LogInResponseModel logInResponseModel;

  RegisterSuccess({required this.logInResponseModel});

  @override
  // TODO: implement props
  List<Object?> get props => [logInResponseModel];

}
class RegisterPageError extends RegisterPageState{
  final error;

  RegisterPageError({ required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [error];

}