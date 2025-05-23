import 'package:car_rental_app/app/data_layer/data/remote/api/responses/vehicle_data.dart';
import 'package:car_rental_app/app/data_layer/domain/usecases/vehicle/get_vehicle_list.dart';
import 'package:car_rental_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../core/di/di_container.dart';
import '../../../data_layer/domain/repositories/pref_repository.dart';

class HomeController extends GetxController {
  final _pref = sl<PrefRepository>();
  get user => _pref.getUserData();

  var isLoading = true.obs;
  var vehicleList = <VehicleData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getVehicles();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getVehicles() async {
    isLoading(true);
    var result = await sl<GetVehicleList>().call();
    isLoading(false);
    result.fold(
            (l) {
              Get.rawSnackbar(message: l.error);
            },
            (r) {
              vehicleList(r);
            });
  }

  void callLogout() {
    _pref.logout();
    Get.offAllNamed(Routes.AUTH);
  }
}
