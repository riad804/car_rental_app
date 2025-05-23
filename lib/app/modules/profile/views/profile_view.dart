import 'package:car_rental_app/app/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../data_layer/data/remote/api/responses/profile_data.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Obx(() => Skeletonizer(
            enabled: controller.isLoading.value,
            child: Padding(
              padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          // color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.callLogout();
                        },
                        child: Icon(
                          Icons.logout,
                          // color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ProfileDataView(data: controller.data.value),

                  ListTile(
                    leading: Icon(Icons.trip_origin),
                    title: Text(
                      'Total Trips',
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: Text(
                      "${controller.data.value.totalTrips ?? "0.0"}",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.rawSnackbar(message: "not implemented yet!");
                  //   },
                  //   child: ListTile(
                  //     leading: Icon(Icons.car_rental),
                  //     title: Text(
                  //       'My Rides',
                  //       style: TextStyle(fontSize: 14),
                  //     ),
                  //     // trailing: Icon(Icons.arrow_forward_ios_rounded),
                  //   ),
                  // ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class ProfileDataView extends StatelessWidget {
  final ProfileData? data;

  ProfileDataView({this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            foregroundColor: Colors.blue,
            // backgroundImage: AssetImage(
            //   'images/ToyFaces_Colored_BG_47.jpg',
            // ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            data?.name ?? "full name",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            data?.email ?? "example@example.com",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}