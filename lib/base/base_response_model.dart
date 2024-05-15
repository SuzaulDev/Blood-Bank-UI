class BaseResponseModel{
   int? _statusCode;
   bool? _status;
   String? _message;
   String? _messageBn;
   Object? _data;


  BaseResponseModel({
    int? statusCode,
    bool? status,
    String? message,
    String? messageBn,
    Object? data})
  {
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
   Object? get data => _data;
   set data(Object? data) => _data = data;

   BaseResponseModel.fromJson(Map<String, dynamic> json) {
     _statusCode = json['statusCode'];
     _status = json['status'];
     _message = json['message'];
     _messageBn = json['messageBn'];
     _data = json['data'];
   }



}