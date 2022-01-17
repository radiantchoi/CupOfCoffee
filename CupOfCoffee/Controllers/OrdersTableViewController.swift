//
//  OrdersTableViewController.swift
//  CupOfCoffee
//
//  Created by Gordon Choi on 2022/01/17.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
}

extension OrdersTableViewController {
    private func populateOrders() {
        guard let coffeeOrdersUrl = URL(string: "https://island-bramble.glitch.me/orders")
        else {
            fatalError("Incorrect URL")
        }
        
        let resource = Resource<[Order]>(url: coffeeOrdersUrl)
        WebService().load(resource: resource) { result in
            switch result {
            case .success(let orders):
                print(orders)
            case .failure(let error):
                print(error)
            }
        }
    }
}
