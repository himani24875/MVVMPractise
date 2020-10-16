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
    
    var indicator = UIActivityIndicatorView(style: .medium)
    
    let cellName = "EmployeeTVC"
    var viewModel = EmployeeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialze()
    }
    
    private func initialze() {
        self.registerCell()
        self.viewModel.delegate = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 600
        
        self.viewModel.getUsersList()
    }
    
    private func registerCell() {
        let nib = UINib(nibName: cellName, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: cellName)
    }
}

//MARK:- UITableViewDelegate
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

extension ViewController: EmployeeDelegate {
    func showLoader() {
        self.indicator.frame = self.view.frame
        self.indicator.center = self.view.center
        self.view.addSubview(indicator)
        self.indicator.startAnimating()
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            self.indicator.stopAnimating()
            self.indicator.removeFromSuperview()
        }
    }
    
    func updateTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
