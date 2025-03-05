import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let batteryChannel = FlutterMethodChannel(name:
                                                    "kr.co.sg.platform_channel_demo/battery",
                                                  binaryMessenger: controller.binaryMessenger)
        
        // 실행 시 플러터 엔진이 꺼져 있을 수도 있는 것을 가정.
        batteryChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            guard self != nil else { return }
            
            if call.method == "getBatteryLevel" {
                let device = UIDevice.current
                device.isBatteryMonitoringEnabled = true
                if device.batteryState == UIDevice.BatteryState.unknown {
//                    result(FlutterError(code: "UNAVAILABLE",
//                                        message: "Battery info unavailable",
//                                        details: nil))
                    result(Int(33))
                } else {
                    result(Int(device.batteryLevel * 100))
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        })
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
