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
    
    let rootViewController: UINavigationController
    
    let conversionViewController = ConversionViewController()

    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
        self.rootViewController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        
        rootViewController.viewControllers = [conversionViewController]
        
    }
    
}
