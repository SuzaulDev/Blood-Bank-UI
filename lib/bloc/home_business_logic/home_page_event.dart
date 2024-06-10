import 'package:blood_bank_app/bloc/home_business_logic/home_page_state.dart';
import 'package:blood_bank_app/data/models/blood_donor_response_model.dart';
import 'package:blood_bank_app/data/models/blood_request_response_model.dart';
import 'package:blood_bank_app/data/models/menu_item_response_model.dart';
import 'package:blood_bank_app/data/models/app_user_response_model.dart';
import 'package:blood_bank_app/data/models/user_role_assign_model.dart';
import 'package:blood_bank_app/data/models/user_role_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomePageEvent extends Equatable{

}
/// **Author**: Md. Sabbir Hossain
/// **Version**: 1.0.0
/// **Email**: sabbirr883@gmail.com
class LoadHomePage extends HomePageEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ShowDrawerMenuDetails extends HomePageEvent{
  final menuUrl;
  ShowDrawerMenuDetails({this.menuUrl});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddNewMenu extends HomePageEvent{
  final  MenuItemModel menuItem;
  AddNewMenu({required this.menuItem});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class UpdateMenu extends HomePageEvent{
  final  MenuItemModel menuItem;
  UpdateMenu({required this.menuItem});
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}
class DeleteMenu extends HomePageEvent{
  final  MenuItemModel menuItem;
  DeleteMenu({required this.menuItem});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class AddNewUser extends HomePageEvent{
  final AppUserModel appUserModel;
  AddNewUser({required this.appUserModel});

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class DeleteUser extends HomePageEvent{
  final AppUserModel appUserModel;
  DeleteUser({required this.appUserModel});

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class AddNewUserRole extends HomePageEvent{
  final UserRoleModel userRoleModel;
  AddNewUserRole({ required this.userRoleModel});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class DeleteUserRole extends HomePageEvent{
  final UserRoleModel userRoleModel;
  DeleteUserRole({required this.userRoleModel});

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class SetUserRole extends HomePageEvent {
  final UserRoleAssignModel userRoleAssignModel;
  SetUserRole({required this.userRoleAssignModel});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class DeleteUserRoleAssign extends HomePageEvent{
  final UserRoleAssignModel userRoleAssignModel;
  DeleteUserRoleAssign({ required this.userRoleAssignModel});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ControlBottomNavigation extends HomePageEvent{
  final int indexNumber;
  ControlBottomNavigation({required this.indexNumber});

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class AddNewDonor extends HomePageEvent{
  final DonorInfoModel donorInfoModel ;
  AddNewDonor({ required this.donorInfoModel});

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class SendBloodRequest extends HomePageEvent{
  final BloodRequestModel bloodRequestModel;
  SendBloodRequest({required this.bloodRequestModel});

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class AcceptBloodRequestByDonor extends HomePageEvent{
  final BloodRequestModel bloodRequestModel;

  AcceptBloodRequestByDonor({required this.bloodRequestModel});

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class OnProcessingBloodRequest extends HomePageEvent{
final  BloodRequestModel bloodRequestModel;
OnProcessingBloodRequest({required this.bloodRequestModel});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnCompleteBloodRequest extends HomePageEvent{
 final BloodRequestModel bloodRequestModel;
 OnCompleteBloodRequest({required this.bloodRequestModel});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class FilterByCityName extends HomePageEvent{
  final String cityName;
  FilterByCityName({required this.cityName});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class FilterByBloodGroup extends HomePageEvent{
  final String bloodGroup;
  FilterByBloodGroup({required this.bloodGroup});

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class FilterByAllValue extends HomePageEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class SearchFilter extends HomePageEvent{
  final String value;
  SearchFilter({required this.value});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}



