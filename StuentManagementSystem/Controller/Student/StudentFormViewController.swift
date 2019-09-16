//
//  StudentFormViewController.swift
//  StuentManagementSystem
//
//  Created by Nazim Uddin on 15/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class StudentFormViewController: UIViewController {

    @IBOutlet weak var studentNameLbl: UITextField!
    @IBOutlet weak var studentEmailLbl: UITextField!
    @IBOutlet weak var studentMobileLbl: UITextField!
    @IBOutlet weak var actionButtonOutlet: UIButton!
    var college:College?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func studentActionButton(_ sender: Any) {
        self.saveStudentInfo()
    }
    
}
// MARK: Methods
extension StudentFormViewController{
    func saveStudentInfo()
    {
        guard let studentName = studentNameLbl.text else {return}
        guard let studentEmail = studentEmailLbl.text else {return}
        guard let studentMobile = studentMobileLbl.text else {return}
        guard let mainCollege = college else {return}
        let dic = [
            "name":studentName,
            "email":studentEmail,
            "mobile":studentMobile
        ]
        DatabaseManager.shareInstance.saveStudentInfo(object: dic, college: mainCollege)
        navigationController?.popViewController(animated: true)
    }
    func updateCollegeInfo()
    {
        guard let studentName = studentNameLbl.text else {return}
        guard let studentEmail = studentEmailLbl.text else {return}
        guard let studentMobile = studentMobileLbl.text else {return}
        
        let dic = [
            "name":studentName,
            "email":studentEmail,
            "mobile":studentMobile
        ]
        DatabaseManager.shareInstance.saveStudentInfo(object: dic, college:college!)
        navigationController?.popViewController(animated: true)
    }
}
