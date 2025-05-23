import 'package:car_rental_app/app/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/input_text_field.dart';
import '../../widgets/progress_diolog.dart';
import '../controllers/auth_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  AuthController get controller => Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: Column(
            children: [
              Text("CarRent", style: GoogleFonts.museoModerno().copyWith(
                fontSize: 60.f,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 30.h),
              InputTextField(
                controller: controller.registerNameController,
                label: 'Name',
                obscure: false,
                icon: Icon(Icons.person),
              ),
              InputTextField(
                controller: controller.registerEmailController,
                label: 'Email',
                obscure: false,
                icon: Icon(Icons.email_outlined),
              ),
              InputTextField(
                controller: controller.registerPasswordController,
                label: 'Password',
                obscure: true,
                icon: Icon(Icons.lock),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  if (controller.registerNameController.text.isEmpty) {
                    Get.rawSnackbar(message: "Name field should not be empty");
                  } else if (!controller.registerEmailController.text.contains('@')) {
                    Get.rawSnackbar(message: "Please provide a valid email address");
                  } else if (controller.registerPasswordController.text.length < 6) {
                    Get.rawSnackbar(message: "Please provide a password of length more than 6");
                  } else {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return ProgressDialog(
                          status: 'Registering you\nPlease wait',
                        );
                      },
                    );
                    controller.callRegister();
                  }
                },
                child: CustomButton(
                  text: 'Sign Up',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  controller.pageViewController.jumpToPage(0);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a registered user?\t',
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      'Login here',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
