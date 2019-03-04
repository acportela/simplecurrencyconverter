//
//  RatesResponse.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/3/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

struct RatesResponse: Codable {
    let base: String
    let rates: [String: Double]
}
