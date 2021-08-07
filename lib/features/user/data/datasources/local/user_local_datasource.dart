import 'package:hive/hive.dart';
import 'package:ojire_tdd/config/constants.dart';
import 'package:ojire_tdd/features/user/data/models/user.dart';
import 'package:ojire_tdd/features/user/domain/entities/user_entity.dart';

class UserLocalDatasource {
  final _kUserBoxName = Db.USER_BOX;

  Future<bool> initDb() async {
    try {
      Hive.registerAdapter(UserAdapter());
      await Hive.openBox<User>(_kUserBoxName);
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> addUser({UserEntity? user}) async {
    try {
      print("SAVE DATA LOCALLY");
      // return users hive box
      final userBox = Hive.box<User>(_kUserBoxName);
      // add an entry from hive box
      User _user = User.fromEntity(user!);
      // _user.id = userBox.length;
      userBox.add(_user);
      _user.id = userBox.length + 1;
      _user.save();

      // userBox.put("${userBox.length + 1}", _user);
      print("TOTAL DATA: ${userBox.length}");
      print("TOTAL DATA: ${_user.toJson().toString()}");

      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> removeUser(int index) async {
    try {
      // return users hive box
      final userBox = Hive.box<User>(_kUserBoxName);
      // add an entry from hive box
      userBox.deleteAt(index);
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateUser(int index, User user) async {
    try {
      // return users hive box
      final userBox = Hive.box<User>(_kUserBoxName);
      // add an entry from hive box
      userBox.putAt(index, user);
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteDb() async {
    // TODO: implement deleteDb
    throw UnimplementedError();
  }

  Future<bool> insertUsers(List<User> users) async {
    try {
      // return users hive box
      final userBox = Hive.box<User>(_kUserBoxName);
      // clear all enrties from hive box
      final deleted = await userBox.clear();
      // print deleted entries
      print('delete $deleted entries from hive $_kUserBoxName box');
      // convert User to HiveType User
      final converted = users
          .map(
            (e) => User(
              id: e.id,
              name: e.name,
              mobileNumber: e.mobileNumber,
              email: e.email,
              password: e.password,
              pin: e.pin,
            ),
          )
          .toList();
      // insert all users to hive box
      final entries = await userBox.addAll(converted);
      print(entries);
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteAllUsers() async {
    try {
      // return users hive box
      final userBox = Hive.box<User>(_kUserBoxName);
      // clear all enrties from hive box
      final deleted = await userBox.clear();
      // print deleted entries
      print('delete $deleted entries from hive $_kUserBoxName box');
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<UserEntity>> getUsers() async {
    // return users hive box
    final userBox = Hive.box<User>(_kUserBoxName);
    List<UserEntity> list = [];
    userBox.values.forEach((user) {
      list.add(user.toEntity());
    });

    return list;
  }

  Future<List<UserEntity>> searchUsers({String? mobileNumber, String? password}) async {
    // return users hive box
    final userBox = Hive.box<User>(_kUserBoxName);
    return userBox.values.map<UserEntity>((e) {
      return User(
        id: e.id,
        name: e.name,
        mobileNumber: e.mobileNumber,
        email: e.email,
        password: e.password,
        pin: e.pin,
      ).toEntity();
    }).toList();
  }
}
