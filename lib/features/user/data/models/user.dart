import 'package:hive/hive.dart';
import 'package:ojire_tdd/features/user/domain/entities/user_entity.dart';

part 'user.g.dart';

@HiveType(adapterName: 'UserAdapter', typeId: 0)
class User extends HiveObject {
  User({
    this.id,
    this.name,
    this.mobileNumber,
    this.email,
    this.password,
    this.pin,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? mobileNumber;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? password;
  @HiveField(5)
  int? pin;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        mobileNumber: json["mobileNumber"],
        email: json["email"],
        password: json["password"],
        pin: json["pin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobileNumber": mobileNumber,
        "email": email,
        "password": password,
        "pin": pin,
      }..removeWhere((k, v) => v == null);

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      mobileNumber: mobileNumber,
      email: email,
      password: password,
      pin: pin,
    );
  }

  static User fromEntity(UserEntity entity) {
    return User(
      id: entity.id,
      name: entity.name,
      mobileNumber: entity.mobileNumber,
      email: entity.email,
      password: entity.password,
      pin: entity.pin,
    );
  }
}
