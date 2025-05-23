import 'package:car_rental_app/app/data_layer/domain/usecases/auth/login.dart';
import 'package:car_rental_app/app/data_layer/domain/usecases/auth/register.dart';
import 'package:car_rental_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/di/di_container.dart';

class AuthController extends GetxController {
  final pageViewController = PageController(initialPage: 0);

  // login input controllers
  var loginEmailController = TextEditingController();
  var loginPasswordController = TextEditingController();


  // register input controllers
  var registerNameController = TextEditingController();
  var registerEmailController = TextEditingController();
  var registerPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    pageViewController.dispose();

    loginEmailController.dispose();
    loginPasswordController.dispose();

    registerNameController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    super.onClose();
  }

  void callLogin() async {
    LoginParams params = LoginParams(
      email: loginEmailController.text,
      password: loginPasswordController.text,
    );
    var result = await sl<Login>().call(params);
    Get.back();
    result.fold((l) {
      Get.rawSnackbar(message: "${l.error}");
    }, (r) {
      Get.offAllNamed(Routes.HOME);
    });
  }

  void callRegister() async {
    RegisterParams params = RegisterParams(
      name: registerNameController.text,
      email: registerEmailController.text,
      password: registerPasswordController.text,
    );
    var result = await sl<Register>().call(params);
    Get.back();
    result.fold((l) {
      Get.rawSnackbar(message: "${l.error}");
    }, (r) {
      Get.rawSnackbar(message: "Register success!");
      pageViewController.jumpToPage(0);
    });
  }
}
