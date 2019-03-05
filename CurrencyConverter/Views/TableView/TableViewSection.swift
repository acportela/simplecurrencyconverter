//
//  TableViewSection.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/2/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

public protocol TableViewSection {
    
    var numberOfRows: Int { get }
    
    func registerCells(in tableView: UITableView)
    
    func cellHeight(forCellAt indexPath: IndexPath, on tableView: UITableView) -> CGFloat
    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell
    
    func tableViewCell(_ tableView: UITableView, shouldSelectCellAt indexPath: IndexPath) -> Bool
    func tableViewCell(_ tableView: UITableView, didSelectCellAt indexPath: IndexPath)
    
    func replaceCellBuilders(at range: Range<Int>, with builders: [TableViewCellBuilder])
    
}

public extension TableViewSection {
    
    func tableViewCell(_ tableView: UITableView, didSelectCellAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func replaceCellBuilders(at range: Range<Int>, with builders: [TableViewCellBuilder]) {
        
    }
    
}
