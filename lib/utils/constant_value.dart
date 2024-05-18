import 'package:blood_bank_app/data/models/menu_item_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> bloodGroupType = [
  'A+',
  'O+',
  'B+',
  'AB+',
  'A-',
  'O-',
  'B-',
  'AB-'
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
final List<MenuItemModel> defultMenu = [
  MenuItemModel(
      id: 1,
      active: true,
      name: "Settings",
      banglaName: "",
      icon: "setting",
      menuUrl: "setting",
      view: true,
      insert: true,
      delete: true),
  MenuItemModel(
      id: 2,
      active: true,
      name: "Support",
      banglaName: "",
      icon: "support",
      menuUrl: "support",
      view: true,
      insert: true,
      delete: true),
  MenuItemModel(
      id: 3,
      active: true,
      name: "About",
      banglaName: "",
      icon: "about",
      menuUrl: "about",
      view: true,
      insert: true,
      delete: true),
];

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
  'null': Icons.abc_outlined,
  'about': Icons.info_rounded,
  'support': Icons.help,
};
