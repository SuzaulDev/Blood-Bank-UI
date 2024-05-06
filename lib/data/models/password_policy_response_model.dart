class PasswordPolicyResponseModel {
  int? _statusCode;
  bool? _status;
  String? _message;
  String? _messageBn;
  List<PasswordPolicyModel>? _data;

  PasswordPolicyResponseModel(
      {int? statusCode,
        bool? status,
        String? message,
        String? messageBn,
        List<PasswordPolicyModel>? data}) {
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
  List<PasswordPolicyModel>? get data => _data;
  set data(List<PasswordPolicyModel>? data) => _data = data;

  PasswordPolicyResponseModel.fromJson(Map<String, dynamic> json) {
    _statusCode = json['statusCode'];
    _status = json['status'];
    _message = json['message'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <PasswordPolicyModel>[];
      json['data'].forEach((v) {
        _data!.add(new PasswordPolicyModel.fromJson(v));
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

class PasswordPolicyModel {
  int? _id;
  String? _name;
  String? _banglaName;
  bool? _active;
  int? _minLength;
  bool? _sequential;
  bool? _specialChar;
  bool? _alphanumeric;
  bool? _upperLower;
  bool? _matchUsername;
  int? _passwordRemember;
  int? _passwordAge;
  int? _devCode;

  Data(
      {int? id,
        String? name,
        String? banglaName,
        bool? active,
        int? minLength,
        bool? sequential,
        bool? specialChar,
        bool? alphanumeric,
        bool? upperLower,
        bool? matchUsername,
        int? passwordRemember,
        int? passwordAge,
        int? devCode}) {
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
    if (minLength != null) {
      this._minLength = minLength;
    }
    if (sequential != null) {
      this._sequential = sequential;
    }
    if (specialChar != null) {
      this._specialChar = specialChar;
    }
    if (alphanumeric != null) {
      this._alphanumeric = alphanumeric;
    }
    if (upperLower != null) {
      this._upperLower = upperLower;
    }
    if (matchUsername != null) {
      this._matchUsername = matchUsername;
    }
    if (passwordRemember != null) {
      this._passwordRemember = passwordRemember;
    }
    if (passwordAge != null) {
      this._passwordAge = passwordAge;
    }
    if (devCode != null) {
      this._devCode = devCode;
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
  int? get minLength => _minLength;
  set minLength(int? minLength) => _minLength = minLength;
  bool? get sequential => _sequential;
  set sequential(bool? sequential) => _sequential = sequential;
  bool? get specialChar => _specialChar;
  set specialChar(bool? specialChar) => _specialChar = specialChar;
  bool? get alphanumeric => _alphanumeric;
  set alphanumeric(bool? alphanumeric) => _alphanumeric = alphanumeric;
  bool? get upperLower => _upperLower;
  set upperLower(bool? upperLower) => _upperLower = upperLower;
  bool? get matchUsername => _matchUsername;
  set matchUsername(bool? matchUsername) => _matchUsername = matchUsername;
  int? get passwordRemember => _passwordRemember;
  set passwordRemember(int? passwordRemember) =>
      _passwordRemember = passwordRemember;
  int? get passwordAge => _passwordAge;
  set passwordAge(int? passwordAge) => _passwordAge = passwordAge;
  int? get devCode => _devCode;
  set devCode(int? devCode) => _devCode = devCode;

  PasswordPolicyModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _banglaName = json['banglaName'];
    _active = json['active'];
    _minLength = json['minLength'];
    _sequential = json['sequential'];
    _specialChar = json['specialChar'];
    _alphanumeric = json['alphanumeric'];
    _upperLower = json['upperLower'];
    _matchUsername = json['matchUsername'];
    _passwordRemember = json['passwordRemember'];
    _passwordAge = json['passwordAge'];
    _devCode = json['devCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['banglaName'] = this._banglaName;
    data['active'] = this._active;
    data['minLength'] = this._minLength;
    data['sequential'] = this._sequential;
    data['specialChar'] = this._specialChar;
    data['alphanumeric'] = this._alphanumeric;
    data['upperLower'] = this._upperLower;
    data['matchUsername'] = this._matchUsername;
    data['passwordRemember'] = this._passwordRemember;
    data['passwordAge'] = this._passwordAge;
    data['devCode'] = this._devCode;
    return data;
  }
}