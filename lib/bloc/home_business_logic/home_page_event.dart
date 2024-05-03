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


