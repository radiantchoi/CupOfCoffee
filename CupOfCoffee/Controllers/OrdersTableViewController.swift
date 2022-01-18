//
//  OrdersTableViewController.swift
//  CupOfCoffee
//
//  Created by Gordon Choi on 2022/01/17.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    
    private var orderListViewModel = OrderListViewModel()
    
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
                self.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension OrdersTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.ordersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = self.orderListViewModel.orderViewModel(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdersTableViewCell", for: indexPath)
        
        cell.textLabel?.text = viewModel.coffee
        cell.detailTextLabel?.text = viewModel.size
        
        return cell
    }
}
