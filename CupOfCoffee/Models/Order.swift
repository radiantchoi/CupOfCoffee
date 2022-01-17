//
//  Order.swift
//  CupOfCoffee
//
//  Created by Gordon Choi on 2022/01/17.
//

import Foundation

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}

enum CoffeeType: String, Codable {
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeeSize: String, Codable {
    case small
    case medium
    case large
}
