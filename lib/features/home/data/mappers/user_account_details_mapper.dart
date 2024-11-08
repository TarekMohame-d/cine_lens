import 'package:cine_rank/features/home/data/models/user_account_details_model.dart';
import 'package:cine_rank/features/home/domain/entities/user_account_details_entity.dart';

class UserAccountDetailsMapper {
  static UserAccountDetailsEntity mapToEntity(UserAccountDetailsModel model) =>
      UserAccountDetailsEntity(
        avatar: model.avatar,
        id: model.id,
        name: model.name,
        includeAdult: model.includeAdult,
        userName: model.userName,
      );
}
