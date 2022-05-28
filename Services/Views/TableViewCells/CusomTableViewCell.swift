//
//  CusomTableViewCell.swift
//  Services
//
//  Created by AnnaEvgen on 19.05.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.textAlignment = .left
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var titleDescription: UILabel = {
        let description = UILabel()
        description.font = UIFont.boldSystemFont(ofSize: 12)
        description.textColor = .systemGray
        description.textAlignment = .left
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    lazy var serviceImage: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        image.tintColor = UIColor(red: .random(), green: .random(), blue: .random(), alpha: 1.0)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setupConstraints() {
        
        contentView.addSubview(serviceImage)
        contentView.addSubview(title)
        contentView.addSubview(titleDescription)
        
        serviceImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6).isActive = true
        serviceImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        serviceImage.centerYAnchor.constraint(equalTo: title.centerYAnchor).isActive = true
        
        title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6).isActive = true
        title.leadingAnchor.constraint(equalTo: serviceImage.trailingAnchor, constant: 8).isActive = true
        
        titleDescription.topAnchor.constraint(equalTo: title.bottomAnchor, constant:  6).isActive = true
        titleDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6).isActive = true
        titleDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        titleDescription.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        }
}


extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
