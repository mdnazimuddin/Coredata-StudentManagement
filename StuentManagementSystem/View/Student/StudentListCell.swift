//
//  StudentListCell.swift
//  StuentManagementSystem
//
//  Created by Nazim Uddin on 15/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class StudentListCell: UITableViewCell {

    var student:Student!{
        didSet{
            textLabel?.text = student.name
            detailTextLabel?.text = student.email
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: "cell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
