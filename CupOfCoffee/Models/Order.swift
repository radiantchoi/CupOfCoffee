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

enum CoffeeName: String, Codable, CodingKey, CaseIterable {
    case cappuccino = "Cappuccino"
    case latte = "Latte"
    case espressino = "Espressino"
    case cortado = "Cortado"
    case hotCoffee = "Hot Coffee"
}

enum CoffeeSize: String, Codable, CaseIterable {
    case Small
    case Medium
    case Large
}

extension Order {
    init?(_ viewModel: AddOrderViewModel) {
        guard let name = viewModel.name,
              let total = viewModel.total,
              let coffeeName = CoffeeName(rawValue: viewModel.selectedCoffee!),
              let size = CoffeeSize(rawValue: viewModel.selectedSize!)
        else { return nil }
        
        self.name = name
        self.total = total
        self.coffeeName = coffeeName
        self.size = size
    }
}

extension Order {
    static var all: Resource<[Order]> = {
        guard let url = URL(string: "https://island-bramble.glitch.me/orders")
        else {
            fatalError("URL is incorrect!")
        }
        
        return Resource<[Order]>(url: url)
    }()
    
    static func create(viewModel: AddOrderViewModel) -> Resource<Order?> {
        let order = Order(viewModel)
        guard let url = URL(string: "https://island-bramble.glitch.me/orders")
        else {
            fatalError("URL is incorrect!")
        }
        
        guard let data = try? JSONEncoder().encode(order)
        else {
            fatalError("Error encoding order!")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = .post
        resource.body = data
        
        return resource
    }
}
