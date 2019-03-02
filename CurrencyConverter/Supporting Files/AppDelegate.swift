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
        
        self.window = window
        
        self.coordinator = AppCoordinator(rootWindow: window)
        
        self.coordinator?.start()
        
        return true
    }

}
