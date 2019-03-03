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
        
        let section = StaticSection(cellBuilders: builders)
        
        dataSource = TableViewDataSource(sections: [section], tableView: conversionView.tableView)
        
        conversionView.tableView.reloadData()
        
    }
    
}
