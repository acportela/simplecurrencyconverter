//
//  AppCoordinator.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/2/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

public protocol Coordinator: class {
    func start()
}

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    
    let conversionViewController = ConversionViewController()
    
    init(rootWindow: UIWindow) {
        self.window = rootWindow
    }
    
    func start() {
        
        window.rootViewController = conversionViewController
        window.makeKeyAndVisible()
        
    }
    
}
