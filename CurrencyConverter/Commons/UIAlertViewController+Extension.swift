//
//  UIAlertViewController+Extension.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/4/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    convenience init(title: String,
                     message: String,
                     positiveActionTitle: String,
                     cancelActionTitle: String? = nil,
                     handler: ((UIAlertAction) -> Void)? = nil,
                     cancelHandler: ((UIAlertAction) -> Void)? = nil) {
        
        self.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let positiveAction = UIAlertAction(title: positiveActionTitle,
                                           style: .default,
                                           handler: handler)
        addAction(positiveAction)
        
        if let cancelTitle = cancelActionTitle {
            let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler)
            addAction(cancelAction)
        }
        
    }
    
}
