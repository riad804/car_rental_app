
import 'package:car_rental_app/app/core/utils/type_defs.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/di/di_container.dart';
import '../../../../core/utils/use_cases.dart';
import '../../../data/remote/api/responses/profile_data.dart';
import '../../repositories/user_repository.dart';

@Singleton()
class GetProfile extends UseCaseWithoutParams<ProfileData> {
  @override
  ResultFuture<ProfileData> call() {
    return sl<UserRepository>().getProfile();
  }
}