import 'package:car_rental_app/app/modules/auth/views/login_page.dart';
import 'package:car_rental_app/app/modules/auth/views/register_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageViewController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          LoginPage(),
          RegisterPage(),
        ],
      ),
    );
  }
}
