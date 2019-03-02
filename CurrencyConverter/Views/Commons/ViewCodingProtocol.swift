//
//  ViewCodingProtocol.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/2/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation
import SnapKit

protocol ViewCodingProtocol: class {
    
    func setupViewConfiguration()
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
    
}

extension ViewCodingProtocol {
    
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func configureViews() {}
    
}
