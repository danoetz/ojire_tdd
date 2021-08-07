import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ojire_tdd/core/error/failures.dart';
import 'package:ojire_tdd/core/network/network_info.dart';
import 'package:ojire_tdd/core/usecases/usecase.dart';
import 'package:ojire_tdd/features/user/domain/entities/user_entity.dart';
import 'package:ojire_tdd/features/user/domain/usecases/add_user.dart';
import 'package:ojire_tdd/features/user/domain/usecases/get_local_users.dart';
import 'package:ojire_tdd/features/user/domain/usecases/get_remote_users.dart';
import 'package:ojire_tdd/injector/injector.dart';

enum ViewState { initial, busy, error, data, search, addUser }

class UserController extends GetxController {
  // network info
  final network = Injector.resolve<NetworkInfoI>();
  final getLocalUsers = Injector.resolve<GetLocalUsers>();
  final getRemoteUsers = Injector.resolve<GetRemoteUsers>();
  final addUser = Injector.resolve<AddUser>();
  // view state reactive value
  final viewState = ViewState.initial.obs;
  // device connectivity state reactive value
  final connectivityResult = InternetConnectionStatus.connected.obs;
  // view state history
  final historyViewState = <ViewState>[];

  // storage
  final appdata = GetStorage();

  // users data
  List<UserEntity> _users = [];
  // users getter
  List<UserEntity> get users => List.from(_users);
  // track local/remote users state in view
  bool localUsersView = false;

  @override
  Future onInit() async {
    super.onInit();
    // check for connectivity
    connectivityResult.value = await network.connectivityStatus;

    if (connectivityResult.value == InternetConnectionStatus.disconnected) {
      localFetch();
    } else {
      remoteFetch(mobileNumber: '', password: '');
    }

    // listen to connectivity changed event and update connectivityResult value
    network.onConnectivityChanged.listen((event) {
      connectivityResult.value = event;
      // automatically evoke remote fetch if device is offline
      // and users data is empty, null or in local view
      if (event != InternetConnectionStatus.disconnected && (_users.isEmpty || localUsersView)) {
        remoteFetch(mobileNumber: '', password: '');
      }
    });
  }

  @override
  void onClose() {
    // close subscriptions for rx values
    viewState.close();
    connectivityResult.close();
  }

  // feth data from users service
  Future<void> remoteFetch({required String mobileNumber, required String password}) async {
    localUsersView = false;
    if (viewState.value == ViewState.busy) return;
    if (connectivityResult.value == InternetConnectionStatus.disconnected) {
      Get.snackbar("Can't refresh when offline", "Please connect your device to wifi or mobile network", snackPosition: SnackPosition.BOTTOM);
      return;
    }
    _setState(ViewState.busy);
    final result = await getRemoteUsers.getRemoteUsers(mobileNumber: mobileNumber, password: password);
    _handleFetchResult(result);
  }

  // feth data from local database
  Future<void> localFetch() async {
    localUsersView = true;
    if (viewState.value == ViewState.busy) return;
    _setState(ViewState.busy);
    final result = await getLocalUsers.call(NoParams());
    _handleFetchResult(result, true);
  }

  // feth data from local database
  Future<void> addingUser({UserEntity? user}) async {
    localUsersView = true;
    if (viewState.value == ViewState.busy) return;
    _setState(ViewState.busy);
    final result = await addUser.addUser(user: user);
    _handlePostResult(result, true);
  }

  // handle api fetch result
  void _handlePostResult(Either<Failure, bool> result, [bool local = false]) {
    result.fold((failure) {
      _setState(ViewState.error);
      Get.snackbar('Failed!', "Can't update data", snackPosition: SnackPosition.BOTTOM);
    }, (data) {
      _setState(ViewState.data);
      final notifyLocal = local ? 'locally' : '';
      Get.snackbar('Successfuly!', 'User\'s data updated $notifyLocal', snackPosition: SnackPosition.BOTTOM);
      localFetch();
    });
  }

  // handle api fetch result
  void _handleFetchResult(Either<Failure, List<UserEntity>> result, [bool local = false]) {
    result.fold((failure) {
      _users.clear();
      _setState(ViewState.error);
      Get.snackbar('Refresh failed!', "Can't load users", snackPosition: SnackPosition.BOTTOM);
    }, (data) {
      _users = data;
      _setState(ViewState.data);
      final notifyLocal = local ? '(locally)' : '';
      Get.snackbar('Refresh successfuly!', ' ${_users.length} users fetched $notifyLocal', snackPosition: SnackPosition.BOTTOM);
    });
  }

  // change view
  Future<void> changeView(ViewState viewState) async {
    _setState(viewState);
  }

  // set viewstate
  void _setState(ViewState state) {
    viewState.value = state;
    historyViewState.add(state);
  }

  // update theme
  void changeTheme() {
    bool isDarkMode = appdata.read('darkmode');
    appdata.write('darkmode', !isDarkMode);
  }

  // get theme value
  bool get isDarkMode {
    bool isDarkMode = appdata.read('darkmode');
    return isDarkMode;
  }
}
