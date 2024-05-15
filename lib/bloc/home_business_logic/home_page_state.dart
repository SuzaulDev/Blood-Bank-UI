import 'package:blood_bank_app/data/models/app_user_response_model.dart';
import 'package:blood_bank_app/data/models/menu_item_response_model.dart';
import 'package:blood_bank_app/data/models/user_role_response_model.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/password_policy_response_model.dart';
import '../../data/models/user_role_assign_model.dart';
import '../../data/models/users_models.dart';

/// **Author**: Md. Sabbir Hossain
/// **Version**: 1.0.0
/// **Email**: sabbirr883@gmail.com
abstract class HomePageState extends Equatable {}

class HomePageInitial extends HomePageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomePageLoading extends HomePageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomePageLoaded extends HomePageState {
  final List<UserModel> userModelList;
  final String authToken;
  final int userTypeId;
  final MenuItemResponseModel menuItemResponse;

  HomePageLoaded(
      {required this.userModelList,
      required this.authToken,
      required this.userTypeId,
      required this.menuItemResponse});

  @override
  // TODO: implement props
  List<Object?> get props => [userModelList, authToken];
}

class ApplicationUser extends HomePageState {
  final PasswordPolicyResponseModel passwordPolicyResponse;
  final AppUserResponseModel appUserResponse;

  ApplicationUser(
      {required this.passwordPolicyResponse, required this.appUserResponse});

  @override
  // TODO: implement props
  List<Object?> get props => [passwordPolicyResponse, appUserResponse];
}

class UserRole extends HomePageState {
  final UserRoleResponseModel responseModel;

  UserRole({required this.responseModel});

  @override
  // TODO: implement props
  List<Object?> get props => [responseModel];
}

class UserRoleAssign extends HomePageState {
  final AppUserResponseModel appUserResponseModel;
  final UserRoleResponseModel userRoleResponseModel;
  final UserRoleAssignResponseModel userRoleAssignResponseModel;

  ///need to be uncomment and create model class
  //final UserRoleAssignResponseModel userRoleAssignResponseModel;

  UserRoleAssign({
    required this.appUserResponseModel,
    required this.userRoleResponseModel,
    required this.userRoleAssignResponseModel,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [appUserResponseModel,userRoleResponseModel,userRoleAssignResponseModel];
}

class PasswordPolicy extends HomePageState {
  final PasswordPolicyResponseModel passwordPolicyResponse;

  PasswordPolicy({required this.passwordPolicyResponse});

  @override
  // TODO: implement props
  List<Object?> get props => [passwordPolicyResponse];
}

class MenuItem extends HomePageState {
  final MenuItemResponseModel menuItemResponse;

  MenuItem({required this.menuItemResponse});

  @override
  // TODO: implement props
  List<Object?> get props => [menuItemResponse];
}

class HomePageError extends HomePageState {
  final String errorMessage;

  HomePageError(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}
