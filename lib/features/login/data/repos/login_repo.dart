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
  Future<(RequestTokenModel? requestTokenModel, bool success)>
      getRequestToken() async {
    try {
      var response = await apiService.get(
        endPoint: ApiEndPoints.requestToken,
      );
      RequestTokenModel requestTokenModel =
          RequestTokenModel.fromJson(response);
      debugPrint('Get request token successfully');
      return (requestTokenModel, true);
    } catch (error) {
      debugPrint('Error while getting request token: ${error.toString()}');
      return (null, false);
    }
  }

  Future<(SessionModel? sessionModel, bool success)> createSession(
      {required Map<String, dynamic> body}) async {
    try {
      var response = await apiService.post(
        endPoint: ApiEndPoints.createSession,
        body: body,
      );
      SessionModel sessionModel = SessionModel.fromJson(response);
      debugPrint('Create Session successfully');
      return (sessionModel, true);
    } catch (error) {
      debugPrint('Error while creating session: ${error.toString()}');
      return (null, false);
    }
  }

  Future<(UserAccountModel? userAccountModel, bool success)> getUserAccount(
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
      return (userAccountModel, true);
    } catch (error) {
      debugPrint('Error while Getting user account: ${error.toString()}');
      return (null, false);
    }
  }
}
