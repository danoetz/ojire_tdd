import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? name;
  final String? mobileNumber;
  final String? email;
  final String? password;
  final int? pin;

  UserEntity({
    this.id,
    this.name,
    this.mobileNumber,
    this.email,
    this.password,
    this.pin,
  });

  @override
  List<Object?> get props => [id, name, mobileNumber, email, password, pin];

  Map<String, dynamic> toJson() {
    return {
      "id,": id,
      "name,": name,
      "mobileNumber,": mobileNumber,
      "email,": email,
      "password,": password,
      "pin,": pin,
    };
  }

  @override
  String toString() {
    return 'UserEntity { id: $id, '
        'name: $name, '
        'mobileNumber: $mobileNumber, '
        'email: $email, '
        'password: $password, '
        'pin: $pin, '
        '}';
  }

  static UserEntity fromJson(Map<String, Object> json) {
    return UserEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      mobileNumber: json['mobileNumber'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      pin: json['pin'] as int,
    );
  }
}
