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
    
    var currencies = Currency.allCases
    
    var baseCurrency = Currency.allCases[0] {
        didSet {
            currencies.removeAll { $0 == baseCurrency }
            currencies.insert(baseCurrency, at: 0)
            self.ratesResponse = nil
            setupTableView(firstUse: false)
        }
    }
    
    var latestInput: String? {
        didSet {
            if latestInput != nil { setupTableView(firstUse: false) }
        }
    }
    
    var ratesResponse: RatesResponse? {
        didSet {
            if ratesResponse != nil { setupTableView(firstUse: false) }
        }
    }
    
    override func loadView() {
        self.view = conversionView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Currency Converter"
        setupTableView(firstUse: true)
    
        scheduleRequest()
    
    }
    
}

extension ConversionViewController {
    
    func setupTableView(firstUse: Bool) {
        
        let builders = makeBuilders()
        
        if firstUse {
            
            let section = CurrencyListSection(cellBuilders: builders)
            dataSource = TableViewDataSource(sections: [section],
                                             tableView: conversionView.tableView)
            conversionView.tableView.reloadData()
            
        } else {
            
            guard let dataSource = self.dataSource else {
                return
            }
            
            let range = 1..<builders.count
            let builders = Array(builders.dropFirst())
          
            let section = dataSource.sections[0]
            section.updateCellBuilders(range: range, by: builders)
            
            let indexPaths = range.map { return IndexPath(row: $0, section: 0) }
            conversionView.tableView.reloadRows(at: indexPaths, with: .automatic)
            
        }
    }
    
    func makeBuilders() -> [CurrencyTableViewCellBuilder] {
        
        let builders = currencies.map { currency -> CurrencyTableViewCellBuilder in
            
            let cellWasSelectedCallback: ((Currency) -> Void) = { newBaseCurrency in
                if newBaseCurrency != self.baseCurrency {
                    self.baseCurrency = newBaseCurrency
                }
            }
            
            let inputChanged: ((String) -> Void) = { newValue in
                self.latestInput = newValue
            }
            
            if currency == self.baseCurrency {
                let config = CurrencyTableViewCell.Configuration(currency: currency,
                                                                 selected: cellWasSelectedCallback,
                                                                 inputChanged: inputChanged)
                return CurrencyTableViewCellBuilder(config: config)
            }
            
            guard let rates = self.ratesResponse,
                let latestInput = self.latestInput,
                let rate = rates.rates[currency.rawValue.uppercased()],
                let currentBaseValue = Double(latestInput) else {
                    
                    let config = CurrencyTableViewCell.Configuration(currency: currency,
                                                                     input: "",
                                                                     selected: cellWasSelectedCallback,
                                                                     inputChanged: inputChanged)
                    
                    return CurrencyTableViewCellBuilder(config: config)
                    
            }

            let updatedValue = (rate * currentBaseValue)
            let rounded  = (updatedValue*100).rounded()/100
            let newInput = String(format: "%.2f", rounded)
            
            let config = CurrencyTableViewCell.Configuration(currency: currency,
                                                             input: newInput,
                                                             selected: cellWasSelectedCallback,
                                                             inputChanged: inputChanged)
            
            return CurrencyTableViewCellBuilder(config: config)
            
        }
        
        return builders
        
    }
    
}

extension ConversionViewController {
    
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
