//
//  EmployeeVM.swift
//  PractiseYML
//
//  Created by Himani on 14/10/20.
//  Copyright © 2020 Himani. All rights reserved.
//

import Foundation

protocol EmployeeVMDelegate: class {
//    func showLoader()
//    func hideLoader()
//    func updateTable()
    func employeeFetchStarted()
    func employeeFetchEnded()
    func employeeFetchFailed()
}

class EmployeeVM {
    var employee = [Employee]()
    weak var delegate: EmployeeVMDelegate?
    
    func getUsersList() {
        delegate?.employeeFetchStarted()
        APIManager().getUsers(completionHandler: { [weak self] (response) in
            self?.employee = response?.users ?? []
            self?.delegate?.employeeFetchEnded()
        }) { [weak self] (error) in
            self?.delegate?.employeeFetchFailed()
            print(error.debugDescription)
        }
    }
}
