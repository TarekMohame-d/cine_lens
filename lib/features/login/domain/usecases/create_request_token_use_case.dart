import 'package:cine_lens/core/networking/api_result.dart';
import 'package:cine_lens/features/login/data/models/request_token_model.dart';
import 'package:cine_lens/features/login/domain/repository/login_repo.dart';

class CreateRequestTokenUseCase {
  final LoginRepo _loginRepo;

  CreateRequestTokenUseCase(this._loginRepo);

  Future<ApiResult<RequestTokenModel>> call() async {
    return await _loginRepo.createRequestToken();
  }
}
