//
//  Order.swift
//  CupOfCoffee
//
//  Created by Gordon Choi on 2022/01/17.
//

import Foundation

struct Order: Codable {
    let name: String
    let coffeeName: CoffeeName
    let total: Double
    let size: CoffeeSize
}

enum CoffeeName: String, Codable, CodingKey {
    case cappuccino = "Cappuccino"
    case latte = "Latte"
    case espressino = "Espressino"
    case cortado = "Cortado"
    case hotCoffee = "Hot Coffee"
}

enum CoffeeSize: String, Codable {
    case Small
    case Medium
    case Large
}
