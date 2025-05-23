import 'dart:io';

import 'package:car_rental_app/app/data_layer/data/local/storage.dart';
import 'package:car_rental_app/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/environments.dart';
import 'core/utils/location_permission.dart';
import 'core/utils/size_utils.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  static const METHOD_CHANNEL = MethodChannel('com.map_api_key.flutter');
  String initialRoute = AppPages.INITIAL;

  @override
  void initState() {
    var token = Storage.read<String>(Storage.ACCESS_TOKEN);
    if (token != null) {
      initialRoute = Routes.HOME;
    }
    _setGoogleMapApiKey(Platform.isAndroid ? Environments.googleApiKey : Environments.googleApiKeyIos);
    checkLocationPermission();
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: GoogleFonts.openSans().fontFamily,
          ),
          initialRoute: initialRoute,
          getPages: AppPages.routes,
          themeMode: ThemeMode.system,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1.0),
              ),
              child: child!,
            );
          },
        );
      },
    );
  }


  Future<void> _setGoogleMapApiKey(String mapKey) async {
    Map<String, dynamic> requestData = {"mapKey": mapKey};
    METHOD_CHANNEL.invokeMethod('setGoogleMapKey', requestData).then((value) {
      if (kDebugMode) {
        print("mapkey error===> $value");
      }
    });
  }
}
