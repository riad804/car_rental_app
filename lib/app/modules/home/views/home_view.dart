import 'package:car_rental_app/app/core/utils/size_utils.dart';
import 'package:car_rental_app/app/data_layer/data/remote/api/responses/vehicle_data.dart';
import 'package:car_rental_app/app/data_layer/domain/repositories/pref_repository.dart';
import 'package:car_rental_app/app/modules/widgets/custom_img_view.dart';
import 'package:car_rental_app/app/routes/app_pages.dart';
import 'package:car_rental_app/generated/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/di/di_container.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromRGBO(245, 245, 242, 1),
      appBar: AppBar(
        title: Text("CarRent", style: GoogleFonts.museoModerno().copyWith(
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      drawer: SizedBox(
        width: 255.w,
        child: Drawer(
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {
                  // Get.toNamed(Routes.PROFILE);
                },
                child: SizedBox(
                  height: 165.h,
                  child: DrawerHeader(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40.w,
                          foregroundColor: Colors.blue,
                          // backgroundImage: AssetImage(ResAssets.images.profilePic.path),
                        ),
                        SizedBox(width: 30.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 110.w,
                              child: Text(
                                controller.user?.name ?? "Name",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: null,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Visit Profile',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12.f),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  //
                },
                child: ListTile(
                  leading: Icon(Icons.info_outline_rounded),
                  title: Text(
                    'About us',
                    // style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.callLogout();
                },
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text(
                    'Sign Out',
                    // style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getVehicles();
        },
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            SizedBox(height: 30.h),

            Obx(() => Skeletonizer(
              enabled: controller.isLoading.value,
              child: Column(
                children: List.generate(controller.isLoading.value ? 3 : controller.vehicleList.length, (i) {
                  VehicleData? data = controller.isLoading.value ? null : controller.vehicleList.value[i];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.VEHICLE, arguments: "${data!.id}");
                    },
                    child: Hero(
                      tag: "carDetailsHero",
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.w),
                          ),
                        ),
                        child: Column(
                          children: [
                            CustomImageView(
                              imagePath: data != null ? data.image : ResAssets.images.noImageView.path,
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      data != null ? "\$${data.costPerMinute}/min" : '\$ amount',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.f),
                                    ),
                                    Text(
                                      data != null ? data.name! : "car model name",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.f),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      data != null ? data.status!.toUpperCase() : 'available',
                                      style: TextStyle(
                                        fontSize: 12.f,
                                        fontWeight: FontWeight.bold,
                                        color: (data != null && data.status == "available") ? Colors.green : Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Status',
                                      style: TextStyle(fontSize: 10.f),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 20.f,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
