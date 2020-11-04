//
//  AppDelegate.swift
//  SecondaryClickTesting
//
//  Created by Áron Takács on 2020. 11. 04..
//

import UIKit

class MyApplication: UIApplication {
    override func sendEvent(_ event: UIEvent) {
        defer { super.sendEvent(event) }
        
        guard event.type == .touches, let touches = event.allTouches, touches.count == 1 else {
            return
        }
        let touch = touches.first!
        
        if event.type == .touches, touch.type == .indirectPointer, event.buttonMask == [.secondary] {
            // NOTE: this is called, the event is delivered
            print("looks like a secondary click to me")
        }
    }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static func main() {
        UIApplicationMain(CommandLine.argc,
                          CommandLine.unsafeArgv,
                          NSStringFromClass(MyApplication.self),
                          NSStringFromClass(AppDelegate.self))
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
