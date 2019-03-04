//
//  TableViewDataSource.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/2/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

public class TableViewDataSource: NSObject {
    
    var sections: [TableViewSection] = []
    
    public init(sections: [TableViewSection], tableView: UITableView) {
        self.sections = sections
        
        super.init()
        
        tableView.dataSource = self
        tableView.delegate = self
        registerCells(in: tableView)
        
    }
    
    private func registerCells(in tableView: UITableView) {
        for section in sections {
            section.registerCells(in: tableView)
        }
    }
    
    private func section(at indexPath: IndexPath) -> TableViewSection {
        return sections[indexPath.section]
    }
    
}

extension TableViewDataSource: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].numberOfRows
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
        
    }
    
    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = self.section(at: indexPath)
        
        return section.tableViewCell(at: indexPath, on: tableView)
        
    }
    
}

extension TableViewDataSource: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let size = self.section(at: indexPath).cellHeight(forCellAt: indexPath, on: tableView)
        
        return size
    }
    
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        
        return section(at: indexPath).tableViewCell(tableView, shouldSelectCellAt: indexPath)
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        section(at: indexPath).tableViewCell(tableView, didSelectCellAt: indexPath)
        
    }
    
}
