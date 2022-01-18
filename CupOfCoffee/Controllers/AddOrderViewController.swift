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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var totalTextField: UITextField!
    
    private var viewModel = AddOrderViewModel()
    private var coffeeSizesSegmentedControl: UISegmentedControl!
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
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
        self.coffeeSizesSegmentedControl = UISegmentedControl(items: self.viewModel.size)
        self.coffeeSizesSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.coffeeSizesSegmentedControl)
        
        self.coffeeSizesSegmentedControl.topAnchor.constraint(equalTo: self.tableView.bottomAnchor,
                                                               constant: 20).isActive = true
        
        self.coffeeSizesSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            .isActive = true
    }
}

extension AddOrderViewController {
    @IBAction func save() {
        let name = self.nameTextField.text
        let total = Double(self.totalTextField.text ?? "0.0")
        
        let selectedSize = self.coffeeSizesSegmentedControl.titleForSegment(at: self.coffeeSizesSegmentedControl.selectedSegmentIndex)
        
        guard let indexPath = self.tableView.indexPathForSelectedRow
        else {
            fatalError("Error in selecting coffee!")
        }
        
        self.viewModel.name = name
        self.viewModel.total = total
        self.viewModel.selectedSize = selectedSize
        self.viewModel.selectedCoffee = self.viewModel.coffeeName[indexPath.row]
        
        WebService().load(resource: Order.create(viewModel: self.viewModel)) { result in
            switch result {
            case .success(let order):
                print(order)
            case .failure(let error):
                print(error)
            }
        }
    }
}
