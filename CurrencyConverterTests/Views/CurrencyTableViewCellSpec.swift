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
            
            beforeEach {
                
                let frame = CGRect(x: 0, y: 0, width: 320, height: 80)
                
                sut = CurrencyTableViewCell(frame: frame)
                
                let config = CurrencyTableViewCell.Configuration(currency: .nzd)
                
                sut.setup(with: config)
                
                sut.outlineRecursively(color: .red)
                
            }
            
            context("when presenting on screen") {
                
                context("with a standard size input") {
                    
                    beforeEach {
                        sut.updateInput(value: "123434.42")
                    }
                    
                    it("must render properly") {
                        
                        expect(sut).to(matchSnapshot(named: "CurrencyTableViewCell_SmallInput"))
                        
                    }
                    
                }
                
                context("with a large size input") {
                    
                    beforeEach {
                        sut.updateInput(value: "123434123.34212345")
                    }
                    
                    it("must render properly") {
                        
                        expect(sut).to(matchSnapshot(named: "CurrencyTableViewCell_LargeInput"))
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
}
