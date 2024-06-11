import 'package:blood_bank_app/base/base_response_model.dart';
import 'package:blood_bank_app/data/models/app_user_response_model.dart';
import 'package:blood_bank_app/data/models/blood_donor_response_model.dart';
import 'package:blood_bank_app/data/models/menu_item_response_model.dart';
import 'package:blood_bank_app/data/models/user_role_response_model.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/blood_request_response_model.dart';
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
  final String authToken;
  final int userTypeId;
  final BloodDonorResponseModel bloodDonorResponseModel;
  final List<BloodRequestModel> bloodRequestModelList;

  HomePageLoaded(
      { required this.authToken,
        required this.userTypeId,
        required this.bloodDonorResponseModel,
        required this.bloodRequestModelList,
      });

  @override
  // TODO: implement props
  List<Object?> get props => [ authToken,userTypeId,bloodDonorResponseModel,bloodRequestModelList];
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
  final MenuItemResponseModel menuItemResponseModel;

  UserRole({required this.responseModel, required this.menuItemResponseModel});

  @override
  // TODO: implement props
  List<Object?> get props => [responseModel,menuItemResponseModel];
}

class UserRoleAssign extends HomePageState {
  final AppUserResponseModel appUserResponseModel;
  final UserRoleResponseModel userRoleResponseModel;
  final UserRoleAssignResponseModel userRoleAssignResponseModel;
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

class FeedPage extends HomePageState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class NearByDonor extends HomePageState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class BloodRequest extends HomePageState{
  final BloodDonorResponseModel bloodDonorResponseModel;
  final List<String> cityList;
  final searchedValue;
  BloodRequest({required this.bloodDonorResponseModel,required this.cityList,this.searchedValue});
  @override
  // TODO: implement props
  List<Object?> get props => [bloodDonorResponseModel,cityList];
}
class AddDonor extends HomePageState{
  final PasswordPolicyResponseModel passwordPolicyResponse;
  final BloodDonorResponseModel;
  AddDonor({this.BloodDonorResponseModel,required this.passwordPolicyResponse});
  @override
  // TODO: implement props
  List<Object?> get props => [BloodDonorResponseModel];
}

class About extends HomePageState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ViewBloodRequest extends HomePageState{
  final List<BloodRequestModel> bloodRequestList;

  ViewBloodRequest({required this.bloodRequestList});

  @override
  // TODO: implement props
  List<Object?> get props => [bloodRequestList];

}
class MyBloodRequest extends HomePageState{
  final List<BloodRequestModel> receiverBloodRequest;
  MyBloodRequest({required this.receiverBloodRequest});
  @override
  // TODO: implement props
  List<Object?> get props => [receiverBloodRequest];
}

class ProcessingBloodRequest extends HomePageState{
  final BloodRequestResponseModel bloodRequestResponseModel;
  ProcessingBloodRequest({required this.bloodRequestResponseModel});
  @override
  // TODO: implement props
  List<Object?> get props => [bloodRequestResponseModel];
}