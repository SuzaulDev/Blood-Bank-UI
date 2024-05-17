class UserRoleResponseModel {
  int? _statusCode;
  bool? _status;
  String? _message;
  String? _messageBn;
  List<UserRoleModel>? _data;

  UserRoleResponseModel(
      {int? statusCode,
        bool? status,
        String? message,
        String? messageBn,
        List<UserRoleModel>? data}) {
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
  List<UserRoleModel>? get data => _data;
  set data(List<UserRoleModel>? data) => _data = data;

  UserRoleResponseModel.fromJson(Map<String, dynamic> json) {
    _statusCode = json['statusCode'];
    _status = json['status'];
    _message = json['message'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <UserRoleModel>[];
      json['data'].forEach((v) {
        _data!.add(new UserRoleModel.fromJson(v));
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

class UserRoleModel {
  UserRoleMaster? _userRoleMaster;
  List<UserRoleDetailsList>? _userRoleDetailsList;
  bool isExpanded = false;

  UserRoleModel(
      {UserRoleMaster? userRoleMaster,
        List<UserRoleDetailsList>? userRoleDetailsList}) {
    if (userRoleMaster != null) {
      this._userRoleMaster = userRoleMaster;
    }
    if (userRoleDetailsList != null) {
      this._userRoleDetailsList = userRoleDetailsList;
    }
  }

  UserRoleMaster? get userRoleMaster => _userRoleMaster;
  set userRoleMaster(UserRoleMaster? userRoleMaster) =>
      _userRoleMaster = userRoleMaster;
  List<UserRoleDetailsList>? get userRoleDetailsList => _userRoleDetailsList;
  set userRoleDetailsList(List<UserRoleDetailsList>? userRoleDetailsList) =>
      _userRoleDetailsList = userRoleDetailsList;

  UserRoleModel.fromJson(Map<String, dynamic> json) {
    _userRoleMaster = json['userRoleMaster'] != null
        ? new UserRoleMaster.fromJson(json['userRoleMaster'])
        : null;
    if (json['userRoleDetailsList'] != null) {
      _userRoleDetailsList = <UserRoleDetailsList>[];
      json['userRoleDetailsList'].forEach((v) {
        _userRoleDetailsList!.add(new UserRoleDetailsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._userRoleMaster != null) {
      data['userRoleMaster'] = this._userRoleMaster!.toJson();
    }
    if (this._userRoleDetailsList != null) {
      data['userRoleDetailsList'] =
          this._userRoleDetailsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserRoleMaster {
  int? _id;
  String? _name;
  String? _banglaName;
  bool? _active = true;

  UserRoleMaster(
      {int? id,
        String? name,
        String? banglaName,
        bool? active}) {
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
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get banglaName => _banglaName;
  set banglaName(String? banglaName) => _banglaName = banglaName;
  bool? get active => _active;
  set active(bool? active) => _active = active;

  UserRoleMaster.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _banglaName = json['banglaName'];
    _active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['banglaName'] = this._banglaName;
    data['active'] = this._active;
    return data;
  }
}

class UserRoleDetailsList {
  int? _id;
  String? _name;
  String? _banglaName;
  bool? _active = true;
  int? _menuItemId;
  String? _menuItemName;
  bool? _insert;
  bool? _edit;
  bool? _delete;
  bool? _approve;
  bool? _view;

  UserRoleDetailsList(
      {int? id,
        String? name,
        String? banglaName,
        bool? active,
        int? menuItemId,
        String? menuItemName,
        bool? insert,
        bool? edit,
        bool? delete,
        bool? approve,
        bool? view}) {
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
    if (menuItemId != null) {
      this._menuItemId = menuItemId;
    }
    if (menuItemName != null) {
      this._menuItemName = menuItemName;
    }
    if (insert != null) {
      this._insert = insert;
    }
    if (edit != null) {
      this._edit = edit;
    }
    if (delete != null) {
      this._delete = delete;
    }
    if (approve != null) {
      this._approve = approve;
    }
    if (view != null) {
      this._view = view;
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
  int? get menuItemId => _menuItemId;
  set menuItemId(int? menuItemId) => _menuItemId = menuItemId;
  String? get menuItemName => _menuItemName;
  set menuItemName(String? menuItemName) => _menuItemName = menuItemName;
  bool? get insert => _insert;
  set insert(bool? insert) => _insert = insert;
  bool? get edit => _edit;
  set edit(bool? edit) => _edit = edit;
  bool? get delete => _delete;
  set delete(bool? delete) => _delete = delete;
  bool? get approve => _approve;
  set approve(bool? approve) => _approve = approve;
  bool? get view => _view;
  set view(bool? view) => _view = view;

  UserRoleDetailsList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _banglaName = json['banglaName'];
    _active = json['active'];
    _menuItemId = json['menuItemId'];
    _menuItemName = json['menuItemName'];
    _insert = json['insert'];
    _edit = json['edit'];
    _delete = json['delete'];
    _approve = json['approve'];
    _view = json['view'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['banglaName'] = this._banglaName;
    data['active'] = this._active;
    data['menuItemId'] = this._menuItemId;
    data['menuItemName'] = this._menuItemName;
    data['insert'] = this._insert;
    data['edit'] = this._edit;
    data['delete'] = this._delete;
    data['approve'] = this._approve;
    data['view'] = this._view;
    return data;
  }
}