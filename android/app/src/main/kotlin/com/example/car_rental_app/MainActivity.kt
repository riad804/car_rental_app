package com.example.car_rental_app

import android.content.pm.PackageManager
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.map_api_key.flutter"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "setGoogleMapKey") {
                val mapKey = call.argument<String>("mapKey")
                mapKey?.let { setMapKey(it) }
            } else {
                result.notImplemented()
            }
        }

    }

    private fun setMapKey(mapKey: String) {
        Log.d("Tag", "_setMapKey ==>${mapKey}")

        try {
            val applicationInfo =
                packageManager.getApplicationInfo(packageName, PackageManager.GET_META_DATA)
            applicationInfo.metaData.putString("com.google.android.geo.API_KEY", mapKey)
        } catch (e: PackageManager.NameNotFoundException) {
            e.printStackTrace()
        }
    }
}
