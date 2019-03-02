//
//  CurrencyTableViewCell.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/2/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    
    public init(frame: CGRect) {
        super.init(style: .default, reuseIdentifier: type(of: self).reusableIdentifier)
        self.frame = frame
        setupViewConfiguration()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }

}

extension CurrencyTableViewCell: Reusable {}

extension CurrencyTableViewCell: ViewCodingProtocol {
    
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
}

extension CurrencyTableViewCell {
    
    struct Configuration {
        
    }
    
    func setup(with configuration: Configuration) {
        
    }
    
}
