import 'package:blood_bank_app/data/models/menu_item_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BloodGroup{
  int id;
  String name;
  Color color;
  int amount = 0;
  BloodGroup({required  this.id, required  this.name,required  this.color, required  this.amount});
}

List<String> bloodGroupType = [];

List<BloodGroup> bloodGroupTypeList = [
  BloodGroup(id: 1, name: "A+", color: Colors.pinkAccent,amount: 0),
  BloodGroup(id: 2, name: "A-", color: Colors.blueAccent,amount: 0),
  BloodGroup(id: 3, name: "B+", color: Colors.deepOrangeAccent,amount: 0),
  BloodGroup(id: 4, name: "B-", color: Colors.lightBlue,amount: 0),
  BloodGroup(id: 5, name: "AB+", color: Colors.lightGreen,amount: 0),
  BloodGroup(id: 6, name: "AB-", color: Colors.purple,amount: 0),
  BloodGroup(id: 7, name: "O+", color: Colors.red,amount: 0),
  BloodGroup(id: 8, name: "O-", color: Colors.green,amount: 0),

];
final List<MenuItemModel> systemAdminMenu = [
  MenuItemModel(
      id: 1,
      active: true,
      name: "Dash Board",
      banglaName: "",
      icon: "home",
      menuUrl: "dashboard",
      view: true,
      insert: true,
      delete: true),
  MenuItemModel(
      id: 2,
      active: true,
      name: "Menu Item",
      banglaName: "",
      icon: "menu",
      menuUrl: "menu-item",
      view: true,
      insert: true,
      delete: true),
  MenuItemModel(
      id: 3,
      active: true,
      name: "Application User",
      banglaName: "",
      icon: "user",
      menuUrl: "app-user",
      view: true,
      insert: true,
      delete: true),
  MenuItemModel(
      id: 4,
      active: true,
      name: "User Role",
      banglaName: "",
      icon: "role",
      menuUrl: "user-role",
      view: true,
      insert: true,
      delete: true),
  MenuItemModel(
      id: 5,
      active: true,
      name: "User Role Asign",
      banglaName: "",
      icon: "role_assign",
      menuUrl: "user-role-assign",
      view: true,
      insert: true,
      delete: true),
  MenuItemModel(
      id: 6,
      active: true,
      name: "Password Policy",
      banglaName: "",
      icon: "password_policy",
      menuUrl: "password-policy",
      view: true,
      insert: true,
      delete: true),
];
final List<MenuItemModel> defaultMenu = [
  MenuItemModel(
      id: 1,
      active: true,
      name: "Blood Request",
      banglaName: "",
      icon: "request",
      menuUrl: "blood-request",
      view: true,
      update: true,
      insert: true,
      delete: true),
  MenuItemModel(
      id: 2,
      active: true,
      name: " My Blood Request",
      banglaName: "",
      icon: "my-request",
      menuUrl: "my-blood-request",
      view: true,
      update: true,
      insert: true,
      delete: true),
  MenuItemModel(
      id: 3,
      active: true,
      name: "Settings",
      banglaName: "",
      icon: "setting",
      menuUrl: "setting",
      view: true,
      insert: true,
      update: true,
      delete: true),
  MenuItemModel(
      id: 4,
      active: true,
      name: "Support",
      banglaName: "",
      icon: "support",
      menuUrl: "support",
      view: true,
      insert: true,
      update: true,
      delete: true),
  MenuItemModel(
      id: 5,
      active: true,
      name: "About",
      banglaName: "",
      icon: "about",
      menuUrl: "about",
      view: true,
      insert: true,
      update: true,
      delete: true),
];
final List<String> district = [
  "Dhaka",
  "Faridpur",
  "Gazipur",
  "Gopalganj",
  "Jamalpur",
  "Kishoreganj",
  "Madaripur",
  "Manikganj",
  "Munshiganj",
  "Mymensingh",
  "Narayanganj",
  "Narsingdi",
  "Netrokona",
  "Rajbari",
  "Shariatpur",
  "Sherpur",
  "Tangail",
  "Bogra",
  "Joypurhat",
  "Naogaon",
  "Natore",
  "Nawabganj",
  "Pabna",
  "Rajshahi",
  "Sirajgonj",
  "Dinajpur",
  "Gaibandha",
  "Kurigram",
  "Lalmonirhat",
  "Nilphamari",
  "Panchagarh",
  "Rangpur",
  "Thakurgaon",
  "Barguna",
  "Barisal",
  "Bhola",
  "Jhalokati",
  "Patuakhali",
  "Pirojpur",
  "Bandarban",
  "Brahmanbaria",
  "Chandpur",
  "Chittagong",
  "Comilla",
  "Cox''s Bazar",
  "Feni",
  "Khagrachari",
  "Lakshmipur",
  "Noakhali",
  "Rangamati",
  "Habiganj",
  "Maulvibazar",
  "Sunamganj",
  "Sylhet",
  "Bagerhat",
  "Chuadanga",
  "Jessore",
  "Jhenaidah",
  "Khulna",
  "Kushtia",
  "Magura",
  "Meherpur",
  "Narail",
  "Satkhira", ];

//.........................................................................
//                          Icon Data Map
//.........................................................................
Map<String, IconData> iconsMap = {
  'add_shopping_cart': Icons.add_shopping_cart,
  'calendar_view_week_rounded': Icons.calendar_view_day_rounded,
  'call_end_outlined': Icons.call_end_outlined,
  'call_made': Icons.call_made,
  'home': Icons.home,
  'save': Icons.save,
  'edit': Icons.edit,
  'edit_outline': Icons.edit_outlined,
  'cupertino_delete': CupertinoIcons.delete,
  'delete': Icons.delete,
  'user': Icons.person,
  'menu': Icons.menu,
  'role': Icons.person_pin_rounded,
  'setting': Icons.settings,
  'password_policy': Icons.local_police_rounded,
  'role_assign': Icons.assignment,
  'add_donor': Icons.person_add_rounded,
  'add_user': Icons.person_add_rounded,
  'null': Icons.abc_rounded,
  'about': Icons.info_rounded,
  'support': Icons.help,
  'request' : CupertinoIcons.repeat,
  'my-request': CupertinoIcons.cart,
};
