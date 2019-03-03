//
//  CurrencyListSection.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/2/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

class CurrencyListSection: TableViewSection {
    
    private var cellBuilders: [TableViewCellBuilder]
    
    public var numberOfRows: Int {
        return cellBuilders.count
    }
    
    public init(cellBuilders: [TableViewCellBuilder]) {
        self.cellBuilders = cellBuilders
    }
    
    public func registerCells(in tableView: UITableView) {
        for builder in cellBuilders {
            builder.registerCellIdentifier(in: tableView)
        }
    }
    
    public func cellHeight(forCellAt indexPath: IndexPath, on tableView: UITableView) -> CGFloat {
        
        return cellBuilders[indexPath.row].cellHeight
        
    }
    
    public func tableViewCell(_ tableView: UITableView, shouldSelectCellAt indexPath: IndexPath) -> Bool {
        return cellBuilders[indexPath.row].tableViewShouldSelectCell(tableView)
    }
    
    public func tableViewCell(_ tableView: UITableView, didSelectCellAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row != 0 {
            
            let path = IndexPath(row: 0, section: indexPath.section)
            tableView.moveRow(at: indexPath, to: path)
            
            let removed = cellBuilders.remove(at: indexPath.row)
            cellBuilders.insert(removed, at: 0)
            
            return cellBuilders[0].tableViewDidSelectCell(tableView)
            
        }
        
        return cellBuilders[indexPath.row].tableViewDidSelectCell(tableView)
        
    }
    
    public func tableViewCell(at indexPath: IndexPath,
                              on tableView: UITableView) -> UITableViewCell {
        
        return cellBuilders[indexPath.row].tableViewCell(at: indexPath, on: tableView)
        
    }
    
}
