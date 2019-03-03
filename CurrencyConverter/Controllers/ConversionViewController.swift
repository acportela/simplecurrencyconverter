//
//  ConversionViewController.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/2/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {

    let conversionView = ConversionView()
    
    var dataSource: TableViewDataSource?
    
    let service = RatesService()
    
    var baseCurrency: Currency = .usd {
        didSet {
            //update all cells input value
        }
    }
    
    var ratesResponse: RatesResponse? {
        didSet {
            //update all cells input value
        }
    }
    
    override func loadView() {
        self.view = conversionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Currency Converter"
        setupTableView()
    }

    func setupTableView() {
        
        let builders = Currency.allCases.map { value -> CurrencyTableViewCellBuilder in
            let config = CurrencyTableViewCell.Configuration(currency: value)
            return CurrencyTableViewCellBuilder(config: config)
        }
        
        let section = CurrencyListSection(cellBuilders: builders)
        
        dataSource = TableViewDataSource(sections: [section],
                                         tableView: conversionView.tableView)
        
        conversionView.tableView.reloadData()
        
    }
    
    func scheduleRequest() {
        Timer.scheduledTimer(timeInterval: 1,
                             target: self,
                             selector: #selector(fetchRates),
                             userInfo: nil,
                             repeats: true)
    }
    
    @objc
    func fetchRates() {
        
        service.fetchLatestRates(for: baseCurrency) { [weak self] result in
            
            switch result {
                
            case .success(let response):
                
                if response.base == self?.baseCurrency.rawValue.uppercased() {
                    self?.ratesResponse = response
                }
                
            case .failure:
                //TODO
                break
            }
            
        }
    }
    
}
