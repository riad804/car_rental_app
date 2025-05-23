import 'package:car_rental_app/app/data_layer/data/remote/api/responses/profile_data.dart';
import 'package:car_rental_app/app/data_layer/domain/usecases/user/get_profile.dart';
import 'package:get/get.dart';

import '../../../core/di/di_container.dart';
import '../../../data_layer/domain/repositories/pref_repository.dart';
import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  final _pref = sl<PrefRepository>();
  var isLoading = true.obs;
  var data = ProfileData().obs;
  
  @override
  void onInit() {
    super.onInit();
    getProfileData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getProfileData() async {
    isLoading(true);
    var result = await sl<GetProfile>().call();
    isLoading(false);
    result.fold(
            (l) {
              Get.rawSnackbar(message: l.error);
            }, 
            (r) {
              data(r);
            });
  }

  void callLogout() {
    _pref.logout();
    Get.offAllNamed(Routes.AUTH);
  }
}
