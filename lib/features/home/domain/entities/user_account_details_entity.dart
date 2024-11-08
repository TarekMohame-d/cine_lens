import 'package:cine_rank/features/home/data/models/user_account_details_model.dart';

class UserAccountDetailsEntity {
  Avatar? avatar;
  int? id;
  String? name;
  bool? includeAdult;
  String? userName;
  
  UserAccountDetailsEntity({
    this.avatar,
    this.id,
    this.name,
    this.includeAdult,
    this.userName,
  });
}
