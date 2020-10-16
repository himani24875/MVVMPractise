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
    
    var viewModel = EmployeeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialze()
    }
    
    private func initialze() {
        registerCell()
        viewModel.delegate = self
        
        viewModel.getUsersList()
        setActivityIndicator()
    }
    
    private func setActivityIndicator() {
        indicator.frame = view.frame
        indicator.center = view.center
        view.addSubview(indicator)
    }
    
    private func registerCell() {
        let nib = UINib(nibName: String(describing: EmployeeTVC.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: EmployeeTVC.self))
    }
}

//MARK:- UITableViewDelegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.employee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EmployeeTVC.self), for: indexPath) as! EmployeeTVC
        cell.cellData = self.viewModel.employee[indexPath.row]
        return cell
    }
}

//MARK:- Loader Functions
extension ViewController {
    func showLoader() {
        indicator.startAnimating()
    }
    
    func hideLoader() {
        DispatchQueue.main.async { [weak self] in
            self?.indicator.stopAnimating()
        }
    }
}

//MARK:- EmployeeVMDelegate
extension ViewController: EmployeeVMDelegate {
    func employeeFetchStarted() {
        showLoader()
    }
    
    func employeeFetchEnded() {
        hideLoader()
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func employeeFetchFailed() {
        hideLoader()
    }
}
