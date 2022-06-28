//
//  OrderFormCell.swift
//  Services
//
//  Created by AnnaEvgen on 26.05.2022.
//

import UIKit

class OrderFormCell: UITableViewCell {
    
    var orderF: OrderFormModel!
    
    var textField: UILabel = {
        let textField = UILabel()
        textField.textAlignment = .left
        return textField
    }()
    
    var image: UIImageView = {
        let image = UIImageView()
        image.tintColor = .lightGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var handler: ((String?) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String, handler: @escaping (String?) -> Void) {
        textField.text = text
        self.handler = handler
    }
    
    func setupCell() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(textField)
        contentView.addSubview(image)
        
        image.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        image.widthAnchor.constraint(equalToConstant: 20).isActive = true
        image.heightAnchor.constraint(equalToConstant: 20).isActive = true

        textField.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        textField.trailingAnchor.constraint(equalTo:
                           contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
