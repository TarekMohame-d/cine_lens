import 'package:cine_lens/core/networking/api_result.dart';
import 'package:cine_lens/features/login/data/models/session_model.dart';
import 'package:cine_lens/features/login/domain/repository/login_repo.dart';

class CreateSessionUseCase {
  final LoginRepo _loginRepo;

  CreateSessionUseCase(this._loginRepo);

  Future<ApiResult<SessionModel>> call(Map<String, dynamic> body) async {
    return await _loginRepo.createSession(body);
  }
}
