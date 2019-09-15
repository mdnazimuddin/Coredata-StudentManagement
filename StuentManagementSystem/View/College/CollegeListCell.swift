//
//  CollegeListCell.swift
//  StuentManagementSystem
//
//  Created by Nazim Uddin on 11/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class CollegeListCell: UITableViewCell {

    @IBOutlet weak var collegeNameLbl: UILabel!
    @IBOutlet weak var collegeAddressLbl: UILabel!
    @IBOutlet weak var collegeCityLbl: UILabel!
    @IBOutlet weak var collegeUniversityLbl: UILabel!
    var college:College!{
        didSet{
            let name = college.name ?? "not found"
            let address = college.address ?? "not found"
            let city = college.city ?? "not found"
            let university = college.university ?? "not found"
            
            collegeNameLbl.text = "Name : \(name)"
            collegeAddressLbl.text = "Address : \(address)"
            collegeCityLbl.text = "City : \(city)"
            collegeUniversityLbl.text = "University : \(university)"
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
