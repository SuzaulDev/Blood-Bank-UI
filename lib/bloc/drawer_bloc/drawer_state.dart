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
  final userIdType;
  final List menuItemList;
  DrawerSuccess({required this.userIdType,required this.menuItemList});
  @override
  // TODO: implement props
  List<Object?> get props => [userIdType,menuItemList];

}


class DrawerError extends DrawerState {
  final error;
  DrawerError({required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [error];

}