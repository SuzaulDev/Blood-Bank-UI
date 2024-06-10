class BloodRequestResponseModel {
  int? _statusCode;
  bool? _status;
  String? _message;
  String? _messageBn;
  List<BloodRequestModel>? _data;

  BloodRequestResponseModel(
      {int? statusCode,
        bool? status,
        String? message,
        String? messageBn,
        List<BloodRequestModel>? data}) {
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
  List<BloodRequestModel>? get data => _data;
  set data(List<BloodRequestModel>? data) => _data = data;

  BloodRequestResponseModel.fromJson(Map<String, dynamic> json) {
    _statusCode = json['statusCode'];
    _status = json['status'];
    _message = json['message'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <BloodRequestModel>[];
      json['data'].forEach((v) {
        _data!.add(new BloodRequestModel.fromJson(v));
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

class BloodRequestModel {
  int? _id;
  String? _name;
  String? _banglaName;
  bool? _active;
  String? _requestId;
  int? _receiverId;
  String? _bloodGroup;
  String? _contactNumber;
  String? _hospitalName;
  String? _city;
  String? _dateNeeded;
  String? _estimatedTime;
  int? _donorId;
  bool? _completed;
  bool? _accepted;
  bool? _processing;

  BloodRequestModel(
      {int? id,
        String? name,
        String? banglaName,
        bool? active,
        String? requestId,
        int? receiverId,
        String? bloodGroup,
        String? contactNumber,
        String? hospitalName,
        String? city,
        String? dateNeeded,
        String? estimatedTime,
        int? donorId,
        bool? completed,
        bool? accepted,
        bool? processing}) {
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
    if (requestId != null) {
      this._requestId = requestId;
    }
    if (receiverId != null) {
      this._receiverId = receiverId;
    }
    if (bloodGroup != null) {
      this._bloodGroup = bloodGroup;
    }
    if (contactNumber != null) {
      this._contactNumber = contactNumber;
    }
    if (hospitalName != null) {
      this._hospitalName = hospitalName;
    }
    if (city != null) {
      this._city = city;
    }
    if (dateNeeded != null) {
      this._dateNeeded = dateNeeded;
    }
    if (estimatedTime != null) {
      this._estimatedTime = estimatedTime;
    }
    if (donorId != null) {
      this._donorId = donorId;
    }
    if (completed != null) {
      this._completed = completed;
    }
    if (accepted != null) {
      this._accepted = accepted;
    }
    if (processing != null) {
      this._processing = processing;
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
  String? get requestId => _requestId;
  set requestId(String? requestId) => _requestId = requestId;
  int? get receiverId => _receiverId;
  set receiverId(int? receiverId) => _receiverId = receiverId;
  String? get bloodGroup => _bloodGroup;
  set bloodGroup(String? bloodGroup) => _bloodGroup = bloodGroup;
  String? get contactNumber => _contactNumber;
  set contactNumber(String? contactNumber) => _contactNumber = contactNumber;
  String? get hospitalName => _hospitalName;
  set hospitalName(String? hospitalName) => _hospitalName = hospitalName;
  String? get city => _city;
  set city(String? city) => _city = city;
  String? get dateNeeded => _dateNeeded;
  set dateNeeded(String? dateNeeded) => _dateNeeded = dateNeeded;
  String? get estimatedTime => _estimatedTime;
  set estimatedTime(String? estimatedTime) => _estimatedTime = estimatedTime;
  int? get donorId => _donorId;
  set donorId(int? donorId) => _donorId = donorId;
  bool? get completed => _completed;
  set completed(bool? completed) => _completed = completed;
  bool? get accepted => _accepted;
  set accepted(bool? accepted) => _accepted = accepted;
  bool? get processing => _processing;
  set processing(bool? processing) => _processing = processing;

  BloodRequestModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _banglaName = json['banglaName'];
    _active = json['active'];
    _requestId = json['requestId'];
    _receiverId = json['receiverId'];
    _bloodGroup = json['bloodGroup'];
    _contactNumber = json['contactNumber'];
    _hospitalName = json['hospitalName'];
    _city = json['city'];
    _dateNeeded = json['dateNeeded'];
    _estimatedTime = json['estimatedTime'];
    _donorId = json['donorId'];
    _completed = json['completed'];
    _accepted = json['accepted'];
    _processing = json['processing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['banglaName'] = this._banglaName;
    data['active'] = this._active;
    data['requestId'] = this._requestId;
    data['receiverId'] = this._receiverId;
    data['bloodGroup'] = this._bloodGroup;
    data['contactNumber'] = this._contactNumber;
    data['hospitalName'] = this._hospitalName;
    data['city'] = this._city;
    data['dateNeeded'] = this._dateNeeded;
    data['estimatedTime'] = this._estimatedTime;
    data['donorId'] = this._donorId;
    data['completed'] = this._completed;
    data['accepted'] = this._accepted;
    data['processing'] = this._processing;
    return data;
  }
}
