
import 'package:car_rental_app/app/data_layer/data/remote/api/responses/user_data.dart';
import 'package:car_rental_app/app/data_layer/domain/entities/token_data.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/pref_repository.dart';
import '../storage.dart';

@Singleton(as: PrefRepository)
class PrefRepoImpl implements PrefRepository {
  const PrefRepoImpl();

  @override
  TokenData getToken() {
    return TokenData(accessToken: Storage.read(Storage.ACCESS_TOKEN) ?? "");
  }

  @override
  void setToken(String accessToken) {
    Storage.write(Storage.ACCESS_TOKEN, accessToken);
  }

  @override
  UserData? getUserData() {
    var data = Storage.read(Storage.USER_DATA);
    if (data != null) {
      return UserData.fromJson(data);
    }
    return null;
  }

  @override
  void setUserData(UserData data) {
    Storage.write(Storage.USER_DATA, data.toJson());
  }

  @override
  void logout() {
    Storage.remove(Storage.ACCESS_TOKEN);
    Storage.remove(Storage.USER_DATA);
    Storage.clear();
  }
}