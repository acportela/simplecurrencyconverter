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

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigation = UINavigationController()
        navigation.navigationBar.prefersLargeTitles = true
        navigation.viewControllers = [ConversionViewController()]
        
        self.window = window
        self.window?.rootViewController = navigation
        self.window?.makeKeyAndVisible()
        
        return true
    }

}
