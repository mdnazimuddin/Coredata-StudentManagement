//
//  CollegeDetailViewController.swift
//  StuentManagementSystem
//
//  Created by Nazim Uddin on 15/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class CollegeDetailViewController: UITableViewController {
    @IBOutlet weak var collegeNameLbl: UILabel!
    @IBOutlet weak var collegeAddressLbl: UILabel!
    @IBOutlet weak var collegeCityLbl: UILabel!
    @IBOutlet weak var collegeUniversityLbl: UILabel!
    @IBOutlet weak var collegeStudentLbl: UILabel!
    var collegeDetail:College?
    var indexRow = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "College Info"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.setupCollegeLabel()
    }
    func setupCollegeLabel(){
        collegeNameLbl.text = collegeDetail?.name
        collegeAddressLbl.text = collegeDetail?.address
        collegeCityLbl.text = collegeDetail?.city
        collegeUniversityLbl.text = collegeDetail?.university
        if collegeDetail?.students?.allObjects != nil {
            let students:[Student] = (collegeDetail?.students?.allObjects as? [Student])!
            collegeStudentLbl.text = "\(students.count)"
        }else{
            collegeStudentLbl.text = "0"
        }
    }

    @IBAction func editColegeInfo(_ sender: UIBarButtonItem) {
        let collegeForm:CollegeFormViewController = storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        collegeForm.collegeDetail = self.collegeDetail
        collegeForm.isUpdate = true
        collegeForm.indexRow = self.indexRow
        navigationController?.pushViewController(collegeForm, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let studentListVC:StudentListViewController = storyboard.instantiateViewController(withIdentifier: "StudentListViewController") as! StudentListViewController
            studentListVC.college = collegeDetail
            self.navigationController?.pushViewController(studentListVC, animated: true)
        }
    }


}
