//
//  EmployeeTVC.swift
//  PractiseYML
//
//  Created by Himani on 14/10/20.
//  Copyright © 2020 Himani. All rights reserved.
//

import UIKit

class EmployeeTVC: UITableViewCell {
    
    @IBOutlet weak var userIdLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var phoneNoLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    var cellData: Employee? {
        didSet {
            setData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData() {
        guard let data = cellData else { return }
        
        userIdLbl.text = "\(data.userId)"
        userNameLbl.text = "\(data.firstName) \(data.lastName)"
        phoneNoLbl.text = "\(data.phoneNumber)"
        emailLbl.text = data.emailAddress
    }
}
