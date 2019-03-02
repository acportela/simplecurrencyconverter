//
//  TableViewCellBuilder.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/2/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

public protocol TableViewCellBuilder {
    
    var cellHeight: CGFloat { get }
    
    func registerCellIdentifier(in tableView: UITableView)
    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell
    
    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool
    func tableViewDidSelectCell(_ tableView: UITableView)
    
}

public extension TableViewCellBuilder {
    
    func tableViewDidSelectCell(_ tableView: UITableView) {
        
    }
    
}
