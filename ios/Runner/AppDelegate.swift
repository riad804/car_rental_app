import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController

    let flutterChannel = FlutterMethodChannel(name: "com.map_api_key.flutter", binaryMessenger: controller.binaryMessenger)

    flutterChannel.setMethodCallHandler({
                          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                          if call.method == "setGoogleMapKey" {
                              if let jsonResult = call.arguments as? Dictionary<String, AnyObject> {
                                  let googleMapsApiKey =  jsonResult["mapKey"] as? String ?? ""
                                  GMSServices.provideAPIKey(googleMapsApiKey)
                              }

                          } else {
                              result(FlutterMethodNotImplemented)
                              return
                          }
                      })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
