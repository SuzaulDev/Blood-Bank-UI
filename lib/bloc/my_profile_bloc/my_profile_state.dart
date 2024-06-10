import 'package:blood_bank_app/data/models/app_user_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class MyProfileState extends Equatable{}

class MyProfileInit extends MyProfileState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class MyProfileSuccess extends MyProfileState{
  final AppUserModel appUserModel;

  MyProfileSuccess({required this.appUserModel});

  @override
  // TODO: implement props
  List<Object?> get props => [appUserModel];

}
class MyProfileError extends MyProfileState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}