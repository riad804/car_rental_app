import 'package:car_rental_app/app/core/utils/location_permission.dart';
import 'package:car_rental_app/app/core/utils/size_utils.dart';
import 'package:car_rental_app/app/data_layer/data/remote/api/responses/vehicle_data.dart';
import 'package:car_rental_app/app/data_layer/domain/usecases/vehicle/get_vehicle_details.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../generated/assets.gen.dart';
import '../../../core/di/di_container.dart';
import '../../../data_layer/domain/usecases/vehicle/vehicle_rent.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_img_view.dart';

class VehicleController extends GetxController {

  String get id => Get.arguments as String;

  var isLoading = true.obs;
  var data = VehicleData().obs;

  var locationTitle = "Loading...".obs;
  var locationStreet = "Loading...".obs;

  @override
  void onInit() async {
    super.onInit();
    await checkLocationPermission();
    callVehicleDetails();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void callVehicleDetails() async {
    isLoading(true);
    var result = await sl<GetVehicleDetails>().call(id);
    isLoading(false);
    result.fold(
            (l) {
              Get.rawSnackbar(message: l.error);
            },
            (r) {
              data(r);
              getPlaces();
            });
  }

  void callRentVehicle() async {
    var result = await sl<VehicleRent>().call("${data.value.id}");
    Get.back();
    result.fold(
            (l) {
          Get.rawSnackbar(message: l.error);
        },
            (r) {
              showSuccessDialog();
        });
  }

  getPlaces() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(data.value.location?.lat ?? 0.0, data.value.location?.lng ?? 0.0);
      var address = placemarks.first;
      locationTitle(address.locality);
      locationStreet("${address.subLocality}, ${address.postalCode}, ${address.street}");
    } catch (e) {
      print(e);
    }
  }

  showSuccessDialog() {
    Get.dialog(AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ResAssets.lottie.successAnim.path,
          ),
          SizedBox(height: 10.h),
          Text("Rental started successfully", style: GoogleFonts.poppins().copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 15.f,
          ),),
          SizedBox(height: 30.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40.w),
            child: GestureDetector(
              onTap: () {
                Get.back();
                callVehicleDetails();
              },
              child: CustomButton(
                text: "Ok",
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
