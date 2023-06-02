class AksBaseResponse {
  AksBaseResponse({
    this.statusCode,
    this.message,
    this.error,
    this.errorCode,
    this.data,
  });

  AksBaseResponse.fromJson(dynamic json) {
    data = json['data'];
    statusCode = json['statusCode'];
    message = json['message'];
    error = json['error'];
    errorCode = json['errorCode'];
  }

  int? statusCode;
  String? message;
  String? error;
  String? errorCode;
  dynamic data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = data;
    map['statusCode'] = statusCode;
    map['message'] = message;
    map['error'] = error;
    map['errorCode'] = errorCode;
    return map;
  }
}
