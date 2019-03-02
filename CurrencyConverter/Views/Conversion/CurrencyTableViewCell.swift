//
//  CurrencyTableViewCell.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/2/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit
import SnapKit

class CurrencyTableViewCell: UITableViewCell {
    
    private lazy var countryImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var code: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return view
    }()
    
    private lazy var name: UILabel = {
        let view = UILabel()
        view.textColor = .lightGray
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return view
    }()
    
    private lazy var valueInput: UITextField = {
        let view = UITextField()
        
        view.textColor = .black
        view.textAlignment = .right
        view.adjustsFontSizeToFitWidth = true
        view.minimumFontSize = 10
        view.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        view.attributedText = NSAttributedString(string: "0", attributes: attributes)
        
        return view
        
    }()
    
    private lazy var labelStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillProportionally
        view.alignment = .leading
        view.axis = .vertical
        view.spacing = 5
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fill
        view.alignment = .center
        view.axis = .horizontal
        view.spacing = 5
        return view
    }()
    
    public func updateInput(value: String) {
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        valueInput.attributedText = NSAttributedString(string: value, attributes: attributes)
        
    }
    
    public init(frame: CGRect) {
        super.init(style: .default, reuseIdentifier: type(of: self).reusableIdentifier)
        self.frame = frame
        setupViewConfiguration()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }

}

extension CurrencyTableViewCell: Reusable {}

extension CurrencyTableViewCell: ViewCodingProtocol {
    
    func buildViewHierarchy() {
        addSubview(countryImage)
        addSubview(labelStackView)
        addSubview(contentStackView)
        labelStackView.addArrangedSubview(code)
        labelStackView.addArrangedSubview(name)
        contentStackView.addArrangedSubview(labelStackView)
        contentStackView.addArrangedSubview(valueInput)
    }
    
    func setupConstraints() {
        
        countryImage.snp.makeConstraints { make in
            make.height.width.equalTo(64)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
        }
        
        name.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        contentStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.trailing.bottom.equalToSuperview().inset(8)
            make.leading.equalTo(countryImage.snp.trailing).offset(8)
        }
        
    }
    
    func configureViews() {
        backgroundColor = .white
    }
    
}

extension CurrencyTableViewCell {
    
    struct Configuration {
        let currency: Currencies
    }
    
    func setup(with configuration: Configuration) {
        
        self.countryImage.image = configuration.currency.associatedImage
        self.code.text = configuration.currency.rawValue.uppercased()
        self.name.text = configuration.currency.description
        
    }
    
}
