import 'package:blood_bank_app/data/models/menu_item_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class DrawerState extends Equatable{}
class DrawerInitial extends DrawerState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class DrawerLoading extends DrawerState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class DrawerSuccess extends DrawerState{
  final userTypeId;
  final UserTypeName;
  final List<MenuItemModel> menuItemList;
  DrawerSuccess({this.UserTypeName,required this.userTypeId,required this.menuItemList,});
  @override
  // TODO: implement props
  List<Object?> get props => [userTypeId,menuItemList];

}


class DrawerError extends DrawerState {
  final error;
  DrawerError({required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [error];

}