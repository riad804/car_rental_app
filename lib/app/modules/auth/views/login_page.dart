import 'package:car_rental_app/app/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/input_text_field.dart';
import '../../widgets/progress_diolog.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  AuthController get controller => Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 130.h),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("CarRent", style: GoogleFonts.museoModerno().copyWith(
                  fontSize: 60.f,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 80.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      InputTextField(
                        controller: controller.loginEmailController,
                        label: 'Email',
                        obscure: false,
                        icon: Icon(Icons.email_outlined),
                      ),
                      InputTextField(
                        controller: controller.loginPasswordController,
                        label: 'Password',
                        obscure: true,
                        icon: Icon(Icons.lock),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (!controller.loginEmailController.text.contains('@')) {
                            Get.rawSnackbar(message: "Please provide a valid email address");
                          } else if (controller.loginPasswordController.text.length < 6) {
                            Get.rawSnackbar(message: "Please provide a password of length more than 6");
                          } else {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return ProgressDialog(
                                  status: 'Logging you in...',
                                );
                              },
                            );
                            controller.callLogin();
                          }
                        },
                        child: CustomButton(
                          text: 'Login',
                        ),
                      ),
                      Text("\nDon't have any account?"),
                      GestureDetector(
                        onTap: () {
                          controller.pageViewController.jumpToPage(1);
                        },
                        child: Text(
                          'SignUp here',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.f),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

