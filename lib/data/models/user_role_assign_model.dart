
import 'package:blood_bank_app/base/base_response_model.dart';

class UserRoleAssignResponseModel {
  int? _statusCode;
  bool? _status;
  String? _message;
  String? _messageBn;
  List<UserRoleAssignModel>? _data;

  UserRoleAssignResponseModel(
      {int? statusCode,
        bool? status,
        String? message,
        String? messageBn,
        List<UserRoleAssignModel>? data}) {
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
  List<UserRoleAssignModel>? get data => _data;
  set data(List<UserRoleAssignModel>? data) => _data = data;

  UserRoleAssignResponseModel.fromJson(Map<String, dynamic> json) {
    _statusCode = json['statusCode'];
    _status = json['status'];
    _message = json['message'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <UserRoleAssignModel>[];
      json['data'].forEach((v) {
        _data!.add(new UserRoleAssignModel.fromJson(v));
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

class UserRoleAssignModel{
  Master? _master;
  List<DetailsList>? _detailsList;
  bool isExpanded = false;

  UserRoleAssignModel({Master? master, List<DetailsList>? detailsList}) {
    if (master != null) {
      this._master = master;
    }
    if (detailsList != null) {
      this._detailsList = detailsList;
    }
  }

  Master? get master => _master;
  set master(Master? master) => _master = master;
  List<DetailsList>? get detailsList => _detailsList;
  set detailsList(List<DetailsList>? detailsList) => _detailsList = detailsList;

  UserRoleAssignModel.fromJson(Map<String, dynamic> json) {
    _master =
    json['master'] != null ? new Master.fromJson(json['master']) : null;
    if (json['detailsList'] != null) {
      _detailsList = <DetailsList>[];
      json['detailsList'].forEach((v) {
        _detailsList!.add(new DetailsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._master != null) {
      data['master'] = this._master!.toJson();
    }
    if (this._detailsList != null) {
      data['detailsList'] = this._detailsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Master {
  int? _id;
  String? _name;
  String? _banglaName;
  bool? _active;
  int? _appUserId;
  String? _appUserName;

  Master(
      {int? id,
        String? name,
        String? banglaName,
        bool? active,
        int? appUserId,
        String? appUserName}) {
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
    if (appUserId != null) {
      this._appUserId = appUserId;
    }
    if (appUserName != null) {
      this._appUserName = appUserName;
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
  int? get appUserId => _appUserId;
  set appUserId(int? appUserId) => _appUserId = appUserId;
  String? get appUserName => _appUserName;
  set appUserName(String? appUserName) => _appUserName = appUserName;

  Master.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _banglaName = json['banglaName'];
    _active = json['active'];
    _appUserId = json['appUserId'];
    _appUserName = json['appUserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['banglaName'] = this._banglaName;
    data['active'] = this._active;
    data['appUserId'] = this._appUserId;
    data['appUserName'] = this._appUserName;
    return data;
  }
}
class DetailsList {
  int? _id;
  String? _name;
  String? _banglaName;
  bool? _active;
  int? _userRoleId;
  String? _userRoleName;

  DetailsList(
      {int? id,
        String? name,
        String? banglaName,
        bool? active,
        int? userRoleId,
        String? userRoleName}) {
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
    if (userRoleId != null) {
      this._userRoleId = userRoleId;
    }
    if (userRoleName != null) {
      this._userRoleName = userRoleName;
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
  int? get userRoleId => _userRoleId;
  set userRoleId(int? userRoleId) => _userRoleId = userRoleId;
  String? get userRoleName => _userRoleName;
  set userRoleName(String? userRoleName) => _userRoleName = userRoleName;

  DetailsList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _banglaName = json['banglaName'];
    _active = json['active'];
    _userRoleId = json['userRoleId'];
    _userRoleName = json['userRoleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['banglaName'] = this._banglaName;
    data['active'] = this._active;
    data['userRoleId'] = this._userRoleId;
    data['userRoleName'] = this._userRoleName;
    return data;
  }
}