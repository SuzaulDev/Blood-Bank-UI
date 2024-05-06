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
  int? _id;
  String? _name;
  String? _banglaName;
  bool? _active;
  int? _menuType;
  String? _menuTypeName;
  int? _serialNo;
  String? _url;
  String? _icon;
  bool? _view;
  bool? _insert;
  bool? _update;
  bool? _delete;

  MenuItemModel(
      {int? id,
        String? name,
        String? banglaName,
        bool? active,
        int? menuType,
        String? menuTypeName,
        int? serialNo,
        String? url,
        String? icon,
        bool? view,
        bool? insert,
        bool? update,
        bool? delete}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (banglaName != null) {
      this._banglaName = banglaName;
    }
    if (active != null) {
      this._active = active;
    }
    if (menuType != null) {
      this._menuType = menuType;
    }
    if (menuTypeName != null) {
      this._menuTypeName = menuTypeName;
    }
    if (serialNo != null) {
      this._serialNo = serialNo;
    }
    if (url != null) {
      this._url = url;
    }
    if (icon != null) {
      this._icon = icon;
    }
    if (view != null) {
      this._view = view;
    }
    if (insert != null) {
      this._insert = insert;
    }
    if (update != null) {
      this._update = update;
    }
    if (delete != null) {
      this._delete = delete;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get banglaName => _banglaName;
  set banglaName(String? banglaName) => _banglaName = banglaName;
  bool? get active => _active;
  set active(bool? active) => _active = active;
  int? get menuType => _menuType;
  set menuType(int? menuType) => _menuType = menuType;
  String? get menuTypeName => _menuTypeName;
  set menuTypeName(String? menuTypeName) => _menuTypeName = menuTypeName;
  int? get serialNo => _serialNo;
  set serialNo(int? serialNo) => _serialNo = serialNo;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get icon => _icon;
  set icon(String? icon) => _icon = icon;
  bool? get view => _view;
  set view(bool? view) => _view = view;
  bool? get insert => _insert;
  set insert(bool? insert) => _insert = insert;
  bool? get update => _update;
  set update(bool? update) => _update = update;
  bool? get delete => _delete;
  set delete(bool? delete) => _delete = delete;

  MenuItemModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _banglaName = json['banglaName'];
    _active = json['active'];
    _menuType = json['menuType'];
    _menuTypeName = json['menuTypeName'];
    _serialNo = json['serialNo'];
    _url = json['url'];
    _icon = json['icon'];
    _view = json['view'];
    _insert = json['insert'];
    _update = json['update'];
    _delete = json['delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['banglaName'] = this._banglaName;
    data['active'] = this._active;
    data['menuType'] = this._menuType;
    data['menuTypeName'] = this._menuTypeName;
    data['serialNo'] = this._serialNo;
    data['url'] = this._url;
    data['icon'] = this._icon;
    data['view'] = this._view;
    data['insert'] = this._insert;
    data['update'] = this._update;
    data['delete'] = this._delete;
    return data;
  }


}
