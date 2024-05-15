import '../../bloc/home_business_logic/home_page_state.dart';

class MenuItemResponseModel {
  int? _statusCode;
  bool? _status;
  String? _message;
  String? _messageBn;
  List<MenuItemModel>? _data;

  MenuItemResponseModel(
      {int? statusCode,
        bool? status,
        String? message,
        String? messageBn,
        List<MenuItemModel>? data}) {
    if (statusCode != null) {
      this._statusCode = statusCode;
    }
    if (status != null) {
      this._status = status;
    }
    if (message != null) {
      this._message = message;
    }
    if (messageBn != null) {
      this._messageBn = messageBn;
    }
    if (data != null) {
      this._data = data;
    }
  }

  int? get statusCode => _statusCode;
  set statusCode(int? statusCode) => _statusCode = statusCode;
  bool? get status => _status;
  set status(bool? status) => _status = status;
  String? get message => _message;
  set message(String? message) => _message = message;
  String? get messageBn => _messageBn;
  set messageBn(String? messageBn) => _messageBn = messageBn;
  List<MenuItemModel>? get data => _data;
  set data(List<MenuItemModel>? data) => _data = data;

  MenuItemResponseModel.fromJson(Map<String, dynamic> json) {
    _statusCode = json['statusCode'];
    _status = json['status'];
    _message = json['message'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <MenuItemModel>[];
      json['data'].forEach((v) {
        _data!.add(new MenuItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this._statusCode;
    data['status'] = this._status;
    data['message'] = this._message;
    data['messageBn'] = this._messageBn;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class MenuItemModel {
  int? id;
  String? name;
  String? banglaName;
  bool? active;
  int? menuType;
  String? menuTypeName;
  int? serialNo;
  String? menuUrl;
  String? icon;
  bool? view;
  bool? insert;
  bool? update;
  bool? delete;


  MenuItemModel(
      {this.id,
        this.name,
        this.banglaName,
        this.active,
        this.menuType,
        this.menuTypeName,
        this.serialNo,
        this.menuUrl,
        this.icon,
        this.view,
        this.insert,
        this.update,
        this.delete});

  MenuItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    banglaName = json['banglaName'];
    active = json['active'];
    menuType = json['menuType'];
    menuTypeName = json['menuTypeName'];
    serialNo = json['serialNo'];
    menuUrl = json['menuUrl'];
    icon = json['icon'];
    view = json['view'];
    insert = json['insert'];
    update = json['update'];
    delete = json['delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['banglaName'] = this.banglaName;
    data['active'] = this.active;
    data['menuType'] = this.menuType;
    data['menuTypeName'] = this.menuTypeName;
    data['serialNo'] = this.serialNo;
    data['menuUrl'] = this.menuUrl;
    data['icon'] = this.icon;
    data['view'] = this.view;
    data['insert'] = this.insert;
    data['update'] = this.update;
    data['delete'] = this.delete;
    return data;
  }
}
