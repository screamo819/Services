//
//  ServiceTableViewCell.swift
//  Services
//
//  Created by AnnaEvgen on 25.05.2022.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {

    lazy var title2: UILabel = {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.textAlignment = .left
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {
        contentView.addSubview(title2)
        
        title2.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        title2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
    }
    
}
