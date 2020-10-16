//
//  EmployeeVM.swift
//  PractiseYML
//
//  Created by Himani on 14/10/20.
//  Copyright © 2020 Himani. All rights reserved.
//

import Foundation

protocol EmployeeDelegate: AnyObject {
    func showLoader()
    func hideLoader()
    func updateTable()
}

class EmployeeVM {
    var employee: [Employee]?
    var manager = APIManager()
    weak var delegate: EmployeeDelegate?
    
    func getUsersList() {
        self.delegate?.showLoader()
        self.manager.getUsers(completionHandler: { [weak self] (response) in
            self?.delegate?.hideLoader()
            self?.employee = response?.users
            self?.delegate?.updateTable()
        }) { [weak self] (error) in
            self?.delegate?.hideLoader()
            print(error.debugDescription)
        }
    }
}
