//
//  CollegeFormViewController.swift
//  StuentManagementSystem
//
//  Created by Nazim Uddin on 10/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class CollegeFormViewController: UIViewController{
    
    
    // MARK: Outlet
    @IBOutlet weak var txtFieldCollegeName: UITextField!
    @IBOutlet weak var txtFieldCollegeAddress: UITextField!
    @IBOutlet weak var txtFieldCollegeCity: UITextField!
    @IBOutlet weak var txtFieldUniversity: UITextField!
    @IBOutlet weak var actionBtnOutlet: UIButton!
    // MARK: Variable
    var collegeDetail: College?
    var isUpdate = false
    var indexRow = Int()
    // MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if !isUpdate {
            navigationItem.title = "New College Add"
            actionBtnOutlet.setTitle("SAVE", for: .normal)
        }else {
            navigationItem.title = "Update College Info"
            actionBtnOutlet.setTitle("Update", for: .normal)
            
            txtFieldCollegeName.text = collegeDetail?.name
            txtFieldCollegeAddress.text = collegeDetail?.address
            txtFieldCollegeCity.text = collegeDetail?.city
            txtFieldUniversity.text = collegeDetail?.university
            
        }
    }
    
}
// MARK: Action
extension CollegeFormViewController{
    @IBAction func saveCollegeInfoBtnClick(_ sender: UIButton) {
        if isUpdate {
            self.updateCollegeInfo()
        }else{
            self.saveCollegeInfo()
        }
    }
}
// MARK: Methods
extension CollegeFormViewController{
    func saveCollegeInfo()
    {
        guard let collegeName = txtFieldCollegeName.text else {return}
        guard let collegeAddress = txtFieldCollegeAddress.text else {return}
        guard let collegeCity = txtFieldCollegeCity.text else {return}
        guard let collegeUniversity = txtFieldUniversity.text else {return}
        
        let dic = [
            "name":collegeName,
            "address":collegeAddress,
            "city":collegeCity,
            "university":collegeUniversity
        ]
        DatabaseManager.shareInstance.saveCollegeInfo(object: dic)
        navigationController?.popViewController(animated: true)
    }
    func updateCollegeInfo()
    {
        guard let collegeName = txtFieldCollegeName.text else {return}
        guard let collegeAddress = txtFieldCollegeAddress.text else {return}
        guard let collegeCity = txtFieldCollegeCity.text else {return}
        guard let collegeUniversity = txtFieldUniversity.text else {return}
        
        let dic = [
            "name":collegeName,
            "address":collegeAddress,
            "city":collegeCity,
            "university":collegeUniversity
        ]
        DatabaseManager.shareInstance.updateCollegeInfo(index: indexRow, object: dic)
        navigationController?.popViewController(animated: true)
    }
}
