//
//  StudentListViewController.swift
//  StuentManagementSystem
//
//  Created by Nazim Uddin on 15/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class StudentListViewController: UIViewController {

    @IBOutlet weak var studentListtblView: UITableView!
    var studentData = [Student]()
    override func viewDidLoad() {
        super.viewDidLoad()
        studentListtblView.register(StudentListCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        studentData = DatabaseManager.shareInstance.getAllStudentInfo()
       studentListtblView.reloadData()
    }
    
    @IBAction func addStudentButton(_ sender: Any) {
        let studentForm:StudentFormViewController = storyboard?.instantiateViewController(withIdentifier: "StudentFormViewController") as! StudentFormViewController
        self.navigationController?.pushViewController(studentForm, animated: true)
    }
    
}
extension StudentListViewController :UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:StudentListCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! StudentListCell
        cell.student = studentData[indexPath.row]
        return cell
    }
}
