import 'package:cine_rank/core/networking/api_error_model.dart';

class ApiResult<T> {
  final T? data;
  final ApiErrorModel? error;

  const ApiResult.success(this.data) : error = null;
  const ApiResult.failure(this.error) : data = null;

  bool get isSuccess => data != null;
  bool get isFailure => error != null;
}
