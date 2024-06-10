class LogInResponseModel {
  int? statusCode;
  bool? status;
  String? message;
  String? messageBn;
  Data? data;

  LogInResponseModel(
      {this.statusCode, this.status, this.message, this.messageBn, this.data});

  LogInResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    messageBn = json['messageBn'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['message'] = this.message;
    data['messageBn'] = this.messageBn;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? accessToken;
  int? userTypeId;
  String? userTypeName;
  int? loginTime;
  int? loginExpierDuration;

  Data(
      {this.accessToken,
        this.userTypeName,
        this.userTypeId,
        this.loginTime,
        this.loginExpierDuration});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    userTypeId = json['userTypeId'];
    userTypeName = json['userTypeName'];
    loginTime = json['loginTime'];
    loginExpierDuration = json['loginExpierDuration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['userTypeId'] = this.userTypeId;
    data['userTypeName'] = this.userTypeName;
    data['loginTime'] = this.loginTime;
    data['loginExpierDuration'] = this.loginExpierDuration;
    return data;
  }
}