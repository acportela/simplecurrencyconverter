//
//  ConversionViewController.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/2/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {

    let conversionView = ConversionView()
    
    override func loadView() {
        self.view = conversionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Currency Converter"
    }

}
