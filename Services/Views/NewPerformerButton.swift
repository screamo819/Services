//
//  NewPerformerButton.swift
//  Services
//
//  Created by AnnaEvgen on 14.05.2022.
//

import UIKit

class NewPerformerButton: UIButton {
    
    lazy var nextButton: UIButton = {
        let nextButton = UIButton(type: .custom)
        let image = UIImage(systemName: "chevron.right")
        image?.withTintColor(.systemGreen)
        nextButton.setImage(image, for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        return nextButton
    }()
    
    lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "person.fill")
        icon.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        icon.tintColor = .systemGreen
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    lazy var header: UILabel = {
        let header = UILabel()
        header.font = UIFont.boldSystemFont(ofSize: 16)
        header.text = "Стать исполнителем"
        header.textColor = .systemGreen
        header.textAlignment = .left
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    lazy var headerText: UILabel = {
        let headerText = UILabel()
        headerText.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        headerText.text = "Принимайте заказы и зарабатывайте"
        headerText.textAlignment = .left
        headerText.translatesAutoresizingMaskIntoConstraints = false
        return headerText
    }()
    
    lazy var buttonView: UIView = {
        let buttonView = UIView()
        buttonView.backgroundColor = UIColor.systemBackground
        buttonView.layer.shadowColor = UIColor.gray.cgColor
        buttonView.layer.shadowOffset = CGSize(width: 0, height: 1)
        buttonView.layer.shadowOpacity = 1
        buttonView.layer.shadowRadius = 8
        buttonView.layer.cornerRadius = 8
        buttonView.addSubview(icon)
        buttonView.addSubview(header)
        buttonView.addSubview(nextButton)
        buttonView.addSubview(headerText)
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        return buttonView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        backgroundColor = .white
        addSubview(buttonView)
        addTarget(self, action: #selector(becomePerformer), for: .touchUpInside)
        setupView()
        startAnimatingPressActions()
    }
    
    func setupView() {
        
        icon.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 16).isActive = true
        icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        icon.trailingAnchor.constraint(equalTo: header.leadingAnchor, constant: -12).isActive = true
        
        header.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 16).isActive = true
        header.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant:  44).isActive = true
        header.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: -44).isActive = true
        
        headerText.topAnchor.constraint(equalTo: buttonView.topAnchor, constant:  44).isActive = true
        headerText.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: -16).isActive = true
        headerText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        headerText.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        nextButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: -12).isActive = true
        
        buttonView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        buttonView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        buttonView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: 76).isActive = true
    }
    
    @objc func becomePerformer() {
        print("Переход на новый экран СТАТЬ ИСПОЛНИТЕЛЕМ")
    }
}
