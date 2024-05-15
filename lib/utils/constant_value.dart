import 'package:blood_bank_app/data/models/menu_item_response_model.dart';

List<String> bloodGroupType = ['A+','O+','B+','AB+','A-','O-','B-','AB-'];
final List<MenuItemModel> systemAdminMenu = [
  MenuItemModel(id: 1,active: true,name: "Dash Board",banglaName: "",icon: "",menuUrl: "dashboard",view: true,insert: true,delete: true),
  MenuItemModel(id: 2,active: true,name: "Application User",banglaName: "",icon: "",menuUrl: "app-user",view: true,insert: true,delete: true),
  MenuItemModel(id: 3,active: true,name: "User Role",banglaName: "",icon: "",menuUrl: "user-role",view: true,insert: true,delete: true),
  MenuItemModel(id: 4,active: true,name: "User Role Asign",banglaName: "",icon: "",menuUrl: "user-role-assign",view: true,insert: true,delete: true),
  MenuItemModel(id: 5,active: true,name: "Password Policy",banglaName: "",icon: "",menuUrl: "password-policy",view: true,insert: true,delete: true),
  MenuItemModel(id: 6,active: true,name: "Menu Item",banglaName: "",icon: "",menuUrl: "menu-item",view: true,insert: true,delete: true),
];
