import 'package:cine_rank/features/home/data/models/user_account_details_model.dart';

class UserAccountDetailsEntity {
  final Avatar? avatar;
  final int? id;
  final String? name;
  final bool? includeAdult;
  final String? userName;
  
  UserAccountDetailsEntity({
    this.avatar,
    this.id,
    this.name,
    this.includeAdult,
    this.userName,
  });
}
