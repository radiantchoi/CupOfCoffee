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
    private var coffeeeSizesSegmentedControl: UISegmentedControl!
}

extension AddOrderViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
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

extension AddOrderViewController {
    private func setupUI() {
        self.coffeeeSizesSegmentedControl = UISegmentedControl(items: self.viewModel.size)
        self.coffeeeSizesSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.coffeeeSizesSegmentedControl)
        
        self.coffeeeSizesSegmentedControl.topAnchor.constraint(equalTo: self.tableView.bottomAnchor,
                                                               constant: 20).isActive = true
        
        self.coffeeeSizesSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            .isActive = true
    }
}
