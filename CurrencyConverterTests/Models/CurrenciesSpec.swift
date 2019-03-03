//
//  CurrenciesSpec.swift
//  CurrencyConverterTests
//
//  Created by Antonio Rodrigues on 3/3/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Quick
import Nimble

@testable import CurrencyConverter

class CurrenciesSpec: QuickSpec {
    
    override func spec() {
        
        describe("Currencies") {
            
            context("when fetching associated image") {
                
                let nilImages = Currency.allCases.filter { $0.associatedImage == nil }
                
                it("should never return nil") {
                    expect(nilImages).to(beEmpty())
                }
                
            }
            
        }
        
    }
    
}

