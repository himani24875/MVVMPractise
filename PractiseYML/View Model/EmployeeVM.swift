//
//  EmployeeVM.swift
//  PractiseYML
//
//  Created by Himani on 14/10/20.
//  Copyright © 2020 Himani. All rights reserved.
//

import Foundation

class EmployeeVM {
    var employee: [Employee]?
    var manager = APIManager()
    
    func getUsersList(completionHandler: @escaping() -> Void) {
        self.manager.getUsers(completionHandler: { [weak self] (response) in
            self?.employee = response?.users
            completionHandler()
        }) { (error) in
            print(error.debugDescription)
        }
    }
}
