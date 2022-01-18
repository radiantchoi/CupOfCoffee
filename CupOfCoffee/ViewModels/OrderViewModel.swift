//
//  OrderViewModel.swift
//  CupOfCoffee
//
//  Created by Gordon Choi on 2022/01/18.
//

import Foundation

class OrderListViewModel {
    var ordersViewModel: [OrderViewModel]
    
    init() {
        self.ordersViewModel = [OrderViewModel]()
    }
}

extension OrderListViewModel {
    func orderViewModel(at index: Int) -> OrderViewModel {
        return self.ordersViewModel[index]
    }
}

struct OrderViewModel {
    let order: Order
}

extension OrderViewModel {
    var name: String {
        order.name
    }
    
    var coffee: String {
        order.coffeeName.rawValue
    }
    
    var total: Double {
        order.total
    }
    
    var size: String {
        order.size.rawValue
    }
}
