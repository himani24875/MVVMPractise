//
//  Employee.swift
//  PractiseYML
//
//  Created by Himani on 14/10/20.
//  Copyright © 2020 Himani. All rights reserved.
//

import Foundation

struct UserResponseModel: Codable {
    let users: [Employee]
}

struct Employee: Codable {
    let userId: Int
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let emailAddress: String
}
