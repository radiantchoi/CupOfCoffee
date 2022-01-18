//
//  AddOrderViewModel.swift
//  CupOfCoffee
//
//  Created by Gordon Choi on 2022/01/18.
//

import Foundation

struct AddOrderViewModel {
    var name: String?
    var total: Double?
    
    var coffeeName: [String] {
        return CoffeeName.allCases.map { $0.rawValue.capitalized }
    }
    
    var size: [String] {
        return CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }
}
