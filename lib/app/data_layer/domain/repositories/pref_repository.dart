import 'package:car_rental_app/app/data_layer/data/remote/api/responses/user_data.dart';

import '../entities/token_data.dart';

abstract class PrefRepository {
  TokenData getToken();
  void setToken(String accessToken);

  void setUserData(UserData data);
  UserData? getUserData();

  void logout();
}