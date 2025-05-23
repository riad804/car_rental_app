import 'dart:async';

import 'package:car_rental_app/app/core/utils/size_utils.dart';
import 'package:car_rental_app/app/modules/widgets/custom_img_view.dart';
import 'package:car_rental_app/generated/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/progress_diolog.dart';
import '../controllers/vehicle_controller.dart';

class VehicleView extends GetView<VehicleController> {
  VehicleView({super.key});

  final Completer<GoogleMapController> _controller = Completer();
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Hero(
        tag: "carDetailsHero",
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(() => Skeletonizer(
            enabled: controller.isLoading.value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(235, 235, 240, 1),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 45.h),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 35.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  size: 20.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          controller.data.value.name ?? "Car Name",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.f,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomImageView(
                          imagePath: controller.data.value.image ?? ResAssets.images.noImageView.path,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpecificationWidget(
                        text: controller.data.value.status?.toUpperCase() ?? "",
                        helpText: 'Status',
                      ),
                      Text(
                        'SPECIFICATIONS',
                        style: TextStyle(fontSize: 12.f, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SpecificationWidget(
                            text: '\$ ${controller.data.value.costPerMinute ?? 0.0}',
                            helpText: 'Cost per minute',
                          ),
                          SpecificationWidget(
                            text: "White",
                            helpText: "Car's Color",
                          ),
                          SpecificationWidget(
                            text: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                            helpText: 'Pickup date',
                          ),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      Text(
                        'VEHICLE LOCATION',
                        style: TextStyle(fontSize: 12.f, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 10.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: const Color(0xff4c61f1),
                                        size: 30.h,
                                      ),
                                      Obx(() => Text(
                                        controller.locationTitle.value,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xff8c8c8c),
                                          fontSize: 15.f,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                      Obx(() => Text(
                                        controller.locationStreet.value,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12.f,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 110.h,
                                width: 110.w,
                                child: GoogleMap(
                                  mapType: MapType.hybrid,
                                  onMapCreated: _onMapCreated,
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(controller.data.value.location?.lat ?? 0.0, controller.data.value.location?.lng ?? 0.0),
                                    zoom: 13.0,
                                  ),
                                  onTap: (latLng) {
                                    Get.rawSnackbar(message: "not implemented yet");
                                  },
                                  zoomControlsEnabled: false,
                                  scrollGesturesEnabled: true,
                                  zoomGesturesEnabled: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return ProgressDialog(
                            status: 'Rent progressing....',
                          );
                        },
                      );
                      controller.callRentVehicle();
                    },
                    child: CustomButton(
                      text: 'Rent Now',
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class SpecificationWidget extends StatelessWidget {
  final String helpText;
  final String text;

  SpecificationWidget({required this.text, required this.helpText});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 13.f, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 6.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              helpText,
              style: TextStyle(fontSize: 10.f, color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }
}

