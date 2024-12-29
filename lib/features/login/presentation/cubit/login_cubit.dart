import 'package:cine_rank/core/helpers/constants.dart';
import 'package:cine_rank/core/helpers/secure_storage_helper.dart';
import 'package:cine_rank/core/networking/api_error_model.dart';
import 'package:cine_rank/features/login/data/models/request_token_model.dart';
import 'package:cine_rank/features/login/domain/usecases/create_request_token_use_case.dart';
import 'package:cine_rank/features/login/domain/usecases/create_session_use_case.dart';
import 'package:cine_rank/features/login/domain/usecases/get_user_id_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final CreateRequestTokenUseCase _createRequestTokenUseCase;
  final CreateSessionUseCase _createSessionUseCase;
  final GetUserIdUseCase _getUserIdUseCase;

  LoginCubit(
    this._createRequestTokenUseCase,
    this._createSessionUseCase,
    this._getUserIdUseCase,
  ) : super(LoginInitial());

  Future<RequestTokenModel?> createRequestToken() async {
    emit(LoginGetRequestTokenLoading());
    final result = await _createRequestTokenUseCase.call();
    if (result.isSuccess) {
      emit(LoginGetRequestTokenSuccess(result.data));
      return result.data!;
    } else {
      emit(LoginGetRequestTokenFailure(result.error!));
      return null;
    }
  }

  Future<void> createSession(String requestToken) async {
    emit(LoginCreateSessionLoading());
    final result = await _createSessionUseCase.call(
      {
        'request_token': requestToken,
      },
    );
    if (result.isSuccess && result.data!.success!) {
      emit(LoginCreateSessionSuccess());
      await getUserId(result.data!.sessionId!);
    } else {
      emit(LoginCreateSessionFailure(result.error!));
    }
  }

  Future<void> getUserId(String sessionId) async {
    emit(LoginGetUserIdLoading());
    final result = await _getUserIdUseCase.call(sessionId);
    if (result.isSuccess) {
      await SecureStorageHelper.setData(SecureStorageKeys.userId, result.data!);
      emit(LoginGetUserIdSuccess());
    } else {
      emit(LoginGetUserIdFailure(result.error!));
    }
  }
}
