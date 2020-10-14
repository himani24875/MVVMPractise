//
//  ViewController.swift
//  PractiseYML
//
//  Created by Himani on 14/10/20.
//  Copyright © 2020 Himani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let cellName = "EmployeeTVC"
//    var userList: [Employee]?
    var viewModel = EmployeeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialze()
        self.viewModel.getUsersList(completionHandler: { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        })
    }
    
    private func initialze() {
        self.registerCell()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 600
    }
    
    private func registerCell() {
        let nib = UINib(nibName: cellName, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: cellName)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.employee?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! EmployeeTVC
        cell.cellData = self.viewModel.employee?[indexPath.row]
        return cell
    }
}
