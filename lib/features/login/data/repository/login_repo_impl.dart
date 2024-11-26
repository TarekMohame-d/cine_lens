import 'package:cine_rank/core/networking/api_constants.dart';
import 'package:cine_rank/core/networking/api_error_handler.dart';
import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/features/login/domain/repository/login_repo.dart';
import 'package:flutter/material.dart';

import '../../../../core/networking/api_services.dart';
import '../models/request_token_model.dart';
import '../models/session_model.dart';

class LoginRepoImpl implements LoginRepo {
  ApiService apiService;
  LoginRepoImpl(
    this.apiService,
  );

  @override
  Future<ApiResult<RequestTokenModel>> createRequestToken() async {
    try {
      var response = await apiService.get(
        endPoint: KApiConstants.requestTokenEndpoint,
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

  @override
  Future<ApiResult<SessionModel>> createSession(
      Map<String, dynamic> body) async {
    try {
      var response = await apiService.post(
        endPoint: KApiConstants.createSessionEndpoint,
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

  @override
  Future<ApiResult<int>> getUserId(String sessionId) async {
    try {
      var response = await apiService.get(
        endPoint: KApiConstants.accountEndpoint,
        queryParameters: {
          'session_id': sessionId,
        },
      );
      int userId = response['id'];
      debugPrint('Get user account successfully');
      return ApiResult.success(userId);
    } catch (error) {
      debugPrint('Error while Getting user account: ${error.toString()}');
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  // @override
  // Future<ApiResult<UserAccountDetailsEntity>> getUserAccountDetails(
  //     String sessionId) async {
  //   try {
  //     var response = await apiService.get(
  //       endPoint: KApiConstants.accountEndpoint,
  //       queryParameters: {
  //         'session_id': sessionId,
  //       },
  //     );
  //     UserAccountDetailsModel userAccountModel =
  //         UserAccountDetailsModel.fromJson(response);
  //     UserAccountDetailsEntity userAccountDetailsEntity =
  //         UserAccountDetailsMapper.mapToEntity(userAccountModel);
  //     debugPrint('Get user account successfully');
  //     return ApiResult.success(userAccountDetailsEntity);
  //   } catch (error) {
  //     debugPrint('Error while Getting user account: ${error.toString()}');
  //     return ApiResult.failure(ApiErrorHandler.handle(error));
  //   }
  // }
}
