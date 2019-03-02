//
//  AppDelegate.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 2/27/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigation = UINavigationController()
        
        self.window = window
        self.window?.rootViewController = navigation
        self.window?.makeKeyAndVisible()
        
        self.coordinator = AppCoordinator(rootViewController: navigation)
        self.coordinator?.start()
        
        return true
    }

}
