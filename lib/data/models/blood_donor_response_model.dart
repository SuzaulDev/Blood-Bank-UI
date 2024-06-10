class BloodDonorResponseModel {
  int? _statusCode;
  bool? _status;
  String? _message;
  String? _messageBn;
  List<DonorInfoModel>? _data;

  BloodDonorResponseModel(
      {int? statusCode,
        bool? status,
        String? message,
        String? messageBn,
        List<DonorInfoModel>? data}) {
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
  List<DonorInfoModel>? get data => _data;
  set data(List<DonorInfoModel>? data) => _data = data;

  BloodDonorResponseModel.fromJson(Map<String, dynamic> json) {
    _statusCode = json['statusCode'];
    _status = json['status'];
    _message = json['message'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <DonorInfoModel>[];
      json['data'].forEach((v) {
        _data!.add(new DonorInfoModel.fromJson(v));
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

class DonorInfoModel {
  AppUserDto? _appUserDto;
  DonorInfoDto? _donorInfoDto;

  DonorInfoModel({AppUserDto? appUserDto, DonorInfoDto? donorInfoDto}) {
    if (appUserDto != null) {
      this._appUserDto = appUserDto;
    }
    if (donorInfoDto != null) {
      this._donorInfoDto = donorInfoDto;
    }
  }

  AppUserDto? get appUserDto => _appUserDto;
  set appUserDto(AppUserDto? appUserDto) => _appUserDto = appUserDto;
  DonorInfoDto? get donorInfoDto => _donorInfoDto;
  set donorInfoDto(DonorInfoDto? donorInfoDto) => _donorInfoDto = donorInfoDto;

  DonorInfoModel.fromJson(Map<String, dynamic> json) {
    _appUserDto = json['appUserDto'] != null
        ? new AppUserDto.fromJson(json['appUserDto'])
        : null;
    _donorInfoDto = json['donorInfoDto'] != null
        ? new DonorInfoDto.fromJson(json['donorInfoDto'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._appUserDto != null) {
      data['appUserDto'] = this._appUserDto!.toJson();
    }
    if (this._donorInfoDto != null) {
      data['donorInfoDto'] = this._donorInfoDto!.toJson();
    }
    return data;
  }
}

class AppUserDto {
  int? _id;
  String? _name;
  String? _banglaName;
  bool? _active;
  int? _passwordPolicyId;
  String? _passwordPolicyName;
  String? _username;
  String? _password;
  String? _displayName;
  String? _email;
  String? _mobile;
  int? _userTypeId;
  String? _userTypeName;
  String? _otp;

  AppUserDto(
      {int? id,
        String? name,
        String? banglaName,
        bool? active,
        int? passwordPolicyId,
        String? passwordPolicyName,
        String? username,
        String? password,
        String? displayName,
        String? email,
        String? mobile,
        int? userTypeId,
        String? userTypeName,
        String? otp}) {
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
    if (passwordPolicyId != null) {
      this._passwordPolicyId = passwordPolicyId;
    }
    if (passwordPolicyName != null) {
      this._passwordPolicyName = passwordPolicyName;
    }
    if (username != null) {
      this._username = username;
    }
    if (password != null) {
      this._password = password;
    }
    if (displayName != null) {
      this._displayName = displayName;
    }
    if (email != null) {
      this._email = email;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
    if (userTypeId != null) {
      this._userTypeId = userTypeId;
    }
    if (userTypeName != null) {
      this._userTypeName = userTypeName;
    }
    if (otp != null) {
      this._otp = otp;
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
  int? get passwordPolicyId => _passwordPolicyId;
  set passwordPolicyId(int? passwordPolicyId) =>
      _passwordPolicyId = passwordPolicyId;
  String? get passwordPolicyName => _passwordPolicyName;
  set passwordPolicyName(String? passwordPolicyName) =>
      _passwordPolicyName = passwordPolicyName;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get displayName => _displayName;
  set displayName(String? displayName) => _displayName = displayName;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  int? get userTypeId => _userTypeId;
  set userTypeId(int? userTypeId) => _userTypeId = userTypeId;
  String? get userTypeName => _userTypeName;
  set userTypeName(String? userTypeName) => _userTypeName = userTypeName;
  String? get otp => _otp;
  set otp(String? otp) => _otp = otp;

  AppUserDto.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _banglaName = json['banglaName'];
    _active = json['active'];
    _passwordPolicyId = json['passwordPolicyId'];
    _passwordPolicyName = json['passwordPolicyName'];
    _username = json['username'];
    _password = json['password'];
    _displayName = json['displayName'];
    _email = json['email'];
    _mobile = json['mobile'];
    _userTypeId = json['userTypeId'];
    _userTypeName = json['userTypeName'];
    _otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['banglaName'] = this._banglaName;
    data['active'] = this._active;
    data['passwordPolicyId'] = this._passwordPolicyId;
    data['passwordPolicyName'] = this._passwordPolicyName;
    data['username'] = this._username;
    data['password'] = this._password;
    data['displayName'] = this._displayName;
    data['email'] = this._email;
    data['mobile'] = this._mobile;
    data['userTypeId'] = this._userTypeId;
    data['userTypeName'] = this._userTypeName;
    data['otp'] = this._otp;
    return data;
  }
}

class DonorInfoDto {
  int? _id;
  String? _name;
  String? _banglaName;
  bool? _active;
  String? _bloodGroup;
  String? _lastDonation;
  int? _numOfDonate;
  String? _dateOfBirth;
  String? _occupation;
  String? _city;
  double? _latitude;
  double? _longitude;
  bool? _available;

  DonorInfoDto(
      {int? id,
        String? name,
        String? banglaName,
        bool? active,
        String? bloodGroup,
        String? lastDonation,
        int? numOfDonate,
        String? dateOfBirth,
        String? occupation,
        String? city,
        double? latitude,
        double? longitude,
        bool? available}) {
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
    if (bloodGroup != null) {
      this._bloodGroup = bloodGroup;
    }
    if (lastDonation != null) {
      this._lastDonation = lastDonation;
    }
    if (numOfDonate != null) {
      this._numOfDonate = numOfDonate;
    }
    if (dateOfBirth != null) {
      this._dateOfBirth = dateOfBirth;
    }
    if (occupation != null) {
      this._occupation = occupation;
    }
    if (city != null) {
      this._city = city;
    }
    if (latitude != null) {
      this._latitude = latitude;
    }
    if (longitude != null) {
      this._longitude = longitude;
    }
    if (available != null) {
      this._available = available;
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
  String? get bloodGroup => _bloodGroup;
  set bloodGroup(String? bloodGroup) => _bloodGroup = bloodGroup;
  String? get lastDonation => _lastDonation;
  set lastDonation(String? lastDonation) => _lastDonation = lastDonation;
  int? get numOfDonate => _numOfDonate;
  set numOfDonate(int? numOfDonate) => _numOfDonate = numOfDonate;
  String? get dateOfBirth => _dateOfBirth;
  set dateOfBirth(String? dateOfBirth) => _dateOfBirth = dateOfBirth;
  String? get occupation => _occupation;
  set occupation(String? occupation) => _occupation = occupation;
  String? get city => _city;
  set city(String? city) => _city = city;
  double? get latitude => _latitude;
  set latitude(double? latitude) => _latitude = latitude;
  double? get longitude => _longitude;
  set longitude(double? longitude) => _longitude = longitude;
  bool? get available => _available;
  set available(bool? available) => _available = available;

  DonorInfoDto.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _banglaName = json['banglaName'];
    _active = json['active'];
    _bloodGroup = json['bloodGroup'];
    _lastDonation = json['lastDonation'];
    _numOfDonate = json['numOfDonate'];
    _dateOfBirth = json['dateOfBirth'];
    _occupation = json['occupation'];
    _city = json['city'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['banglaName'] = this._banglaName;
    data['active'] = this._active;
    data['bloodGroup'] = this._bloodGroup;
    data['lastDonation'] = this._lastDonation;
    data['numOfDonate'] = this._numOfDonate;
    data['dateOfBirth'] = this._dateOfBirth;
    data['occupation'] = this._occupation;
    data['city'] = this._city;
    data['latitude'] = this._latitude;
    data['longitude'] = this._longitude;
    data['available'] = this._available;
    return data;
  }
}








