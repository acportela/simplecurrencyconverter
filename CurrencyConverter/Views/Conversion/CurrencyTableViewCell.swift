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
        view.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return view
    }()
    
    private lazy var name: UILabel = {
        let view = UILabel()
        view.textColor = .gray
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return view
    }()
    
    lazy var valueInput: UITextField = {
        let view = UITextField()
        
        view.textColor = .black
        view.textAlignment = .right
        view.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        view.keyboardType = .decimalPad
        view.isUserInteractionEnabled = false
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
        view.spacing = 12
        return view
    }()
    
    var cellWasSelected: ((Currency) -> Void)?
    
    var inputChanged: ((String) -> Void)?
    
    public func updateInput(value: String) {
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue,
            NSAttributedString.Key.underlineColor: UIColor.lightGray
        ]
        valueInput.attributedText = NSAttributedString(string: value, attributes: attributes)
        
    }
    
    public init(frame: CGRect) {
        super.init(style: .default, reuseIdentifier: type(of: self).reusableIdentifier)
        self.frame = frame
        setupViewConfiguration()
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
            make.height.width.equalTo(56)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        name.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        contentStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
            make.trailing.equalToSuperview()
            make.leading.equalTo(countryImage.snp.trailing).offset(16)
        }
        
    }
    
    func configureViews() {
        backgroundColor = .white
        selectionStyle = .none
        valueInput.delegate = self
        valueInput.addTarget(self, action: #selector(editingEnded), for: .editingDidEnd)
        valueInput.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        valueInput.inputAccessoryView = getConfiguredToolBar()
    }
    
    private func getConfiguredToolBar() -> UIToolbar {
        
        let toolbar = UIToolbar()
        
        let doneItem =
            UIBarButtonItem(barButtonSystemItem: .done,
                            target: self,
                            action: #selector(onDoneAction))
        
        toolbar.items = [doneItem]
        toolbar.sizeToFit()
        
        return toolbar
        
    }
    
}

extension CurrencyTableViewCell {
    
    struct Configuration {
        
        let currency: Currency
        let currentInput: String?
        let selected: ((Currency) -> Void)
        let inputChanged: ((String) -> Void)
        
        init(currency: Currency,
             input: String? = nil,
             selected: @escaping ((Currency) -> Void),
             inputChanged: @escaping ((String) -> Void)) {
            
            self.currency = currency
            self.currentInput = input
            self.selected = selected
            self.inputChanged = inputChanged
            
        }
    }
    
    func setup(with configuration: Configuration) {
        
        self.countryImage.image = configuration.currency.associatedImage
        self.code.text = configuration.currency.rawValue.uppercased()
        self.name.text = configuration.currency.description
        self.cellWasSelected = configuration.selected
        self.inputChanged = configuration.inputChanged
        if let current = configuration.currentInput {
            self.valueInput.text = current
        }
        
    }
    
}

extension CurrencyTableViewCell {
    
    @objc
    func editingEnded() {
        valueInput.isUserInteractionEnabled = false
    }
    
    @objc
    func editingChanged() {
        if let updated = valueInput.text {
            inputChanged?(updated)
        }
    }
    
    @objc
    private func onDoneAction() {
        valueInput.resignFirstResponder()
    }
    
}

extension CurrencyTableViewCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        guard let currentText = textField.text else {
            return false
        }
        
        if string.isEmpty { return true }
        
        if currentText.count >= 20 { return false }
        
        if currentText.contains("."), string == "." { return false }
        
        return true
        
    }
    
}
