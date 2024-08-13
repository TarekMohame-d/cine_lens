import 'package:cine_rank/core/networking/api_error_handler.dart';
import 'package:cine_rank/core/networking/api_result.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_services.dart';
import '../models/request_token_model.dart';
import '../models/session_model.dart';
import '../models/user_account_model.dart';
import 'package:flutter/material.dart';

class LoginRepo {
  ApiService apiService;
  LoginRepo({
    required this.apiService,
  });
  Future<ApiResult<RequestTokenModel>> getRequestToken() async {
    try {
      var response = await apiService.get(
        endPoint: ApiEndPoints.requestToken,
      );
      RequestTokenModel requestTokenModel =
          RequestTokenModel.fromJson(response);
      debugPrint('Get request token successfully');
      return ApiResult.success(requestTokenModel);
    } catch (error) {
      debugPrint('Error while getting request token: ${error.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<SessionModel>> createSession(
      {required Map<String, dynamic> body}) async {
    try {
      var response = await apiService.post(
        endPoint: ApiEndPoints.createSession,
        body: body,
      );
      SessionModel sessionModel = SessionModel.fromJson(response);
      debugPrint('Create Session successfully');
      return ApiResult.success(sessionModel);
    } catch (error) {
      debugPrint('Error while creating session: ${error.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UserAccountModel>> getUserAccount(
      {required String sessionId}) async {
    try {
      var response = await apiService.get(
        endPoint: ApiEndPoints.account,
        queryParameters: {
          'session_id': sessionId,
        },
      );
      UserAccountModel userAccountModel = UserAccountModel.fromJson(response);
      debugPrint('Get user account successfully');
      return ApiResult.success(userAccountModel);
    } catch (error) {
      debugPrint('Error while Getting user account: ${error.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
