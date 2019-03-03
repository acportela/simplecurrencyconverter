//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 2/28/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

enum Currency: String, CaseIterable {
    
    case aud
    case bgn
    case brl
    case cad
    case chf
    case cny
    case czk
    case dkk
    case eur
    case gbp
    case hkd
    case hrk
    case huf
    case idr
    case ils
    case inr
    case isk
    case jpy
    case krw
    case mxn
    case myr
    case nok
    case nzd
    case php
    case pln
    case ron
    case rub
    case sek
    case sgd
    case thb
    case `try`
    case usd
    case zar
    
    var associatedImage: UIImage? { return UIImage(named: self.rawValue) }
    
    var description: String {
        
        switch self {
        
        case .aud:
            return "Australian Dollar"
        case .bgn:
            return "Bulgarian Lev"
        case .brl:
            return "Brazilian Real"
        case .cad:
            return "Canadian Dollar"
        case .chf:
            return "Swiss Franc"
        case .cny:
            return "Yuan"
        case .czk:
            return "Czech Koruna"
        case .dkk:
            return "Danish Krone"
        case .eur:
            return "Euro"
        case .gbp:
            return "Pound Sterling"
        case .hkd:
            return "Hong Kong Dollar"
        case .hrk:
            return "Croatian Kuna"
        case .huf:
            return "Forint"
        case .idr:
            return "Rupiah"
        case .ils:
            return "New Israeli Shekel"
        case .inr:
            return "Indian Rupee"
        case .isk:
            return "Iceland Krona"
        case .jpy:
            return "Yen"
        case .krw:
            return "South Korean Won"
        case .mxn:
            return "Mexican Peso"
        case .myr:
            return "Malaysian Ringgit"
        case .nok:
            return "Norwegian Krone"
        case .nzd:
            return "New Zealand Dollar"
        case .php:
            return "Philippine Peso"
        case .pln:
            return "PZloty"
        case .ron:
            return "Leu"
        case .rub:
            return "Russian Ruble"
        case .sek:
            return "Swedish Krona"
        case .sgd:
            return "Singapore Dollar"
        case .thb:
            return "Baht"
        case .try:
            return "Turkish Lira"
        case .usd:
            return "US Dollar"
        case .zar:
            return "Rand"
        }
        
    }
    
}
