//
//  ChooseServiceModel.swift
//  Services
//
//  Created by AnnaEvgen on 25.05.2022.
//

import Foundation

struct ChooseServiceModel {
    var title: String
    
    static let workNames = ["Ремонт квартир и домов", "Мастер на час", "Сантехники", "Электрики", "Окна и двери", "Сварочные работы", "Строительство домов и сооружений", "Проектирования сметы", "Другие услуги"]
    
    static func getWorks() -> [ChooseServiceModel] {
        var work = [ChooseServiceModel]()
        
        for works in workNames {
            work.append(ChooseServiceModel(title: works))
        }
    return work
    }
}
