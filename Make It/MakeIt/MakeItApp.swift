//
//  Make_ItApp.swift
//  Make It
//
//  Created by Allan Soberanski on 24/06/24.
//

import SwiftUI
import SwiftData

@main
class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        navigation.setRootView(TaskView())
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigation.rootViewController
        self.window?.makeKeyAndVisible()
        return true
    }
}
