//
//  ConversionView.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/2/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit
import SnapKit

class ConversionView: UIView {
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.separatorStyle = .none
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }
    
}

extension ConversionView: ViewCodingProtocol {
    
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin)
            make.left.equalTo(safeAreaLayoutGuide.snp.leftMargin).offset(16)
            make.right.equalTo(safeAreaLayoutGuide.snp.rightMargin).inset(16)
        }
        
    }
    
    func configureViews() {
        backgroundColor = .white
    }
    
}
