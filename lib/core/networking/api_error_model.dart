class ApiErrorModel {
  final bool? success;
  final int? statusCode;
  final String? statusMessage;

  ApiErrorModel({required this.success,  this.statusCode, required this.statusMessage});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      success: json['success'],
      statusCode: json['status_code'],
      statusMessage: json['status_message'],
    );
  }
}
