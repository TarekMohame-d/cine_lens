import 'package:cine_rank/core/networking/api_result.dart';
import 'package:cine_rank/features/login/domain/repository/login_repo.dart';

class GetUserIdUseCase {
  final LoginRepo _loginRepo;

  GetUserIdUseCase(this._loginRepo);

  Future<ApiResult<String>> call(String sessionId) async {
    return await _loginRepo.getUserId(sessionId);
  }
}
