//
//  ConversionViewControllerSpec.swift
//  CurrencyConverterTests
//
//  Created by Antonio Rodrigues on 3/4/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import UIKit
@testable import CurrencyConverter

class ConversionViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        var sut: ConversionViewController!
        var window: UIWindow!
        
        describe("ConversionViewController") {
            
            context("when presenting") {
                
                context("on a 4 inch form factor") {
                    
                    beforeEach {
                        let frame = CGRect(x: 0, y: 0, width: 320, height: 568)
                        setupWindow(rect: frame)
                    }
                    
                    it("must render properly") {
                        expect(window).to(matchSnapshot(named: "ConversionViewController_4"))
                    }
                    
                }
                
                context("on a 4.7 inch form factor") {
                    
                    beforeEach {
                        let frame = CGRect(x: 0, y: 0, width: 375, height: 667)
                        setupWindow(rect: frame)
                    }
                    
                    it("must render properly") {
                        expect(window).to(matchSnapshot(named: "ConversionViewController_4_7"))
                    }
                    
                }
                
                context("on a 5.5 form factor") {
                    
                    beforeEach {
                        let frame = CGRect(x: 0, y: 0, width: 414, height: 736)
                        setupWindow(rect: frame)
                    }
                    
                    it("must render properly") {
                        expect(window).to(matchSnapshot(named: "ConversionViewController_5_5"))
                    }
                    
                }
                
                context("on a 5.8 form factor") {
                    
                    beforeEach {
                        let frame = CGRect(x: 0, y: 0, width: 375, height: 812)
                        setupWindow(rect: frame)
                    }
                    
                    it("must render properly") {
                        expect(window).to(matchSnapshot(named: "ConversionViewController_5_8"))
                    }
                    
                }
                
            }
            
        }
        
        func setupWindow(rect: CGRect) {

            window?.rootViewController = nil
            window?.isHidden = true
            
            sut = ConversionViewController()
            
            window = UIWindow(frame: rect)
            
            window.rootViewController = sut
            window.makeKeyAndVisible()
            
        }
    
    }
    
}
