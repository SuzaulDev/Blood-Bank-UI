import 'package:blood_bank_app/bloc/home_business_logic/home_page_state.dart';
import 'package:blood_bank_app/data/models/menu_item_response_model.dart';
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
  final menuSerialNumber;
  ShowDrawerMenuDetails({this.menuSerialNumber});
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


