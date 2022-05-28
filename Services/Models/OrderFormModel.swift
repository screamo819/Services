//
//  OrderFormModel.swift
//  Services
//
//  Created by AnnaEvgen on 26.05.2022.
//

import UIKit

struct OrderFormModel {
    
    var textFieldText: String?
    let image: UIImage?
    
    static let orderText = ["Что нужно сделать?", "Добавить фото", "Место или адрес", "Срок размещения заказа", "Цена за работу (необязательно)"]
    
    static let orderImages = [UIImage(systemName: "text.bubble"), UIImage(systemName: "camera"), UIImage(systemName: "location"), UIImage(systemName: "calendar"), UIImage(systemName: "creditcard")]
    
    static func getOrderValues() -> [OrderFormModel] {
        var orderFormValues = [OrderFormModel]()
        
        for i in 0...4 {
            orderFormValues.append(OrderFormModel(textFieldText: orderText[i],
                                                  image: orderImages[i]))
        }
        return orderFormValues
    }
}
