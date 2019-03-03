//
//  Constants.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/3/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

enum Constants {
    
    enum UserInteractions {}
    enum BaseURL {}

}

extension Constants.UserInteractions {
    
    static let connectionErrorTitle = "No Connection"
    static let connectionError = "An active connection is needed in order to fetch the latest rates"
    static let tryAgain = "Try Again"
    
}

extension Constants.BaseURL {
    
    static let rates = "https://revolut.duckdns.org/latest?base="

}
