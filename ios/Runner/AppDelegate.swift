import UIKit
import Flutter
import GoogleMaps // Import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("YOUR_API_KEY_HERE") // Configure Google Maps with your API Key
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
