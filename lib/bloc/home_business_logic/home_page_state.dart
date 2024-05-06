import 'package:blood_bank_app/data/models/menu_item_response_model.dart';
import 'package:equatable/equatable.dart';
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
  final List<MenuItemModel> menuItemList;
  HomePageLoaded({required this.userModelList,required this.authToken,required this.userTypeId,required this.menuItemList});

  @override
  // TODO: implement props
  List<Object?> get props => [userModelList,authToken];
}

class ApplicationUser extends HomePageState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class UserRole extends HomePageState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class UserRoleAsign extends HomePageState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class PasswordPolicy extends HomePageState{
  final List passwordPolicyList;
  PasswordPolicy({required this.passwordPolicyList});
  @override
  // TODO: implement props
  List<Object?> get props => [passwordPolicyList];
}
class MenuItem extends HomePageState{
  final List<MenuItemModel> menuItemList;
  MenuItem({required this.menuItemList});

  @override
  // TODO: implement props
  List<Object?> get props => [menuItemList];
}

class HomePageError extends HomePageState {
  final String errorMessage;
  HomePageError(this.errorMessage);
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}
