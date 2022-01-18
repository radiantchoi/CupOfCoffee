//
//  AddOrderViewController.swift
//  CupOfCoffee
//
//  Created by Gordon Choi on 2022/01/17.
//

import Foundation
import UIKit

class AddOrderViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = AddOrderViewModel()
}

extension AddOrderViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension AddOrderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.coffeeName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddOrderTableViewCell",
                                                 for: indexPath)
        
        cell.textLabel?.text = self.viewModel.coffeeName[indexPath.row]
        return cell
    }
}
