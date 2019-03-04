//
//  CurrencyTableViewCellSpec.swift
//  CurrencyConverterTests
//
//  Created by Antonio Rodrigues on 3/2/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import CurrencyConverter

class CurrencyTableViewCellSpec: QuickSpec {
    
    override func spec() {
        
        var sut: CurrencyTableViewCell!
        
        describe("CurrencyTableViewCell") {
            
            context("when presenting on screen") {
                
                context("with a standard size input") {
                    
                    beforeEach {
                        prepareSutForInput("000.000")
                    }
                    
                    it("must render properly") {
                        
                        expect(sut).to(matchSnapshot(named: "CurrencyTableViewCell_SmallInput"))
                        
                    }
                    
                }
                
                context("with a large size input") {
                    
                    beforeEach {
                        prepareSutForInput("123434.34212")
                    }
                    
                    it("must render properly") {
                        
                        expect(sut).to(matchSnapshot(named: "CurrencyTableViewCell_LargeInput"))
                        
                    }
                    
                }
                
            }
            
            func prepareSutForInput(_ input: String) {
                
                let frame = CGRect(x: 0, y: 0, width: 320, height: 80)
                
                sut = CurrencyTableViewCell(frame: frame)
                
                let selected: ((Currency) -> Void) = { _ in }
                let inputChanged: ((String) -> Void) = { _ in }
                
                let config = CurrencyTableViewCell.Configuration(currency: .nzd, input: input, selected: selected, inputChanged: inputChanged)
                
                sut.setup(with: config)
                
            }
            
        }
        
    }
    
}
