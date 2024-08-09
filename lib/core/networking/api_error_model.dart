class ApiErrorModel {
  final int? statusCode;
  final String? statusMessage;

  ApiErrorModel({this.statusCode, required this.statusMessage});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      statusCode: json['status_code'],
      statusMessage: json['status_message'],
    );
  }
}
