import 'package:cine_rank/core/networking/api_error_model.dart';

class ApiResult<T> {
  final (T?, ApiErrorModel?) result;

  const ApiResult.success(T data) : result = (data, null);
  const ApiResult.failure(ApiErrorModel apiErrorModel)
      : result = (null, apiErrorModel);

  bool get isSuccess => result.$1 != null;
  bool get isFailure => result.$2 != null;

  T? get data => result.$1;
  ApiErrorModel? get error => result.$2;
}
