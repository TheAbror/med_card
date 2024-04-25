import 'package:hive/hive.dart';

part 'user_data.g.dart';

@HiveType(typeId: 1)
class UserData {
  @HiveField(0)
  String fullName;

  @HiveField(1)
  String shortName;

  @HiveField(2)
  String token;

  @HiveField(3)
  String userID;

  UserData({
    required this.fullName,
    required this.shortName,
    required this.token,
    required this.userID,
  });
}
