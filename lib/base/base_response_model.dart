class BaseApiResponseModel<T> {
  final int? statusCode;
  final bool? status;
  final String? message;
  final String? messageBn;
  final T? data;

  BaseApiResponseModel({
    required this.statusCode,
    required this.status,
    required this.message,
    required this.messageBn,
    required this.data,
  });

  factory BaseApiResponseModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return BaseApiResponseModel(
      statusCode: json['statusCode'],
      status: json['status'],
      message: json['message'],
      messageBn: json['messageBn'],
      data: fromJsonT(json['data']),
    );
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    return {
      'statusCode': statusCode,
      'status': status,
      'message': message,
      'messageBn': messageBn,
      'data': toJsonT(data as T),
    };
  }
}