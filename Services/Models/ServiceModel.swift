//
//  ServiceModel.swift
//  Services
//
//  Created by AnnaEvgen on 20.05.2022.
//

import UIKit

struct Services {
    
    var title: String
    var description: String?
    var image: UIImage?
    
    static let serviceNames = [
        "Популярное", "Ремонт и строительство", "Грузчики и перевозки", "Автосервис",
        "Установка и ремонт техники", "Обучение и репетиторство", "Консультации", "Такси"]
    
    static let serviceDescriptions = ["121 исполнителей", "76 исполнителей", "", "932 исполнителей", "", "", "42 исполнителей", "14 исполнителей"]
    
    static let serviceImages = [UIImage(systemName: "star.fill"), UIImage(systemName: "trash"), UIImage(systemName: "car"), UIImage(systemName: "bus.fill"), UIImage(systemName:"studentdesk"), UIImage(systemName: "star"), UIImage(systemName: "bus"), UIImage(systemName: "eye.fill")]
    
    static func getServices() -> [Services] {
        
        var services = [Services]()
        
        for i in 0...serviceImages.count-1 {
            services.append(Services(title: serviceNames[i],
                                     description: serviceDescriptions[i],
                                     image: serviceImages[i]))
        }
        return services
    }
    
    static func createRandomServices() -> [Services] {
        var services = [Services]()
        for _ in 0...10 {
        let service = Services(title: serviceNames.randomElement()!,
                                description: serviceDescriptions.randomElement()!,
                               image: serviceImages.randomElement()!!)
        services.append(service)
        }
        return services
     }
}
