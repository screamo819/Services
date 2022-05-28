//
//  CreateOrderButton.swift
//  Services
//
//  Created by AnnaEvgen on 28.05.2022.
//

import UIKit

class CreateButton : UIButton {
    
    private var closure: () -> Void
    
    init (_ model: ButtonModel) {
        
        self.closure = model.closure
        super.init(frame: .zero)
        setup(title: model.title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(title: String) {
        backgroundColor = .systemGreen
        setTitle(title, for: .normal)
        layer.cornerRadius = 28
        layer.masksToBounds = true
        addTarget(self, action: #selector(addOrder), for: .touchUpInside)
        startAnimatingPressActions()
    }
    
    @objc func addOrder() {
        closure()
        print("Создан заказ")
    }
}
