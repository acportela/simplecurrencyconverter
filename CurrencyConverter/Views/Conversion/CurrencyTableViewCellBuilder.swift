//
//  CurrencyTableViewCellBuilder.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/2/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

public final class CurrencyTableViewCellBuilder {
    
    var config: CurrencyTableViewCell.Configuration
    
    init(config: CurrencyTableViewCell.Configuration) {
        self.config = config
    }
    
}

extension CurrencyTableViewCellBuilder: TableViewCellBuilder {
    
    public var cellHeight: CGFloat {
        
        return 80
        
    }
    
    public func registerCellIdentifier(in tableView: UITableView) {
        
        tableView.register(CurrencyTableViewCell.self)
        
    }
    
    public func tableViewCell(at indexPath: IndexPath,
                              on tableView: UITableView) -> UITableViewCell {
        
        let cell: CurrencyTableViewCell =
            tableView.dequeue(indexPath: indexPath)
        
        cell.setup(with: config)
        
        return cell
        
    }
    
    public func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return false
    }

}
