import '../../../core/utils/type_defs.dart';
import '../../data/remote/api/responses/profile_data.dart';

abstract class UserRepository {
  ResultFuture<ProfileData> getProfile();
}