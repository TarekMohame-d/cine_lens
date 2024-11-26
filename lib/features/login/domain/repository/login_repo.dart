import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/features/login/data/models/request_token_model.dart';
import 'package:cine_rank/features/login/data/models/session_model.dart';

abstract class LoginRepo {
  Future<ApiResult<RequestTokenModel>> createRequestToken();

  Future<ApiResult<SessionModel>> createSession(Map<String, dynamic> body);
  Future<ApiResult<int>> getUserId(String sessionId);
}
