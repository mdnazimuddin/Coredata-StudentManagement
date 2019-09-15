//
//  ViewController.swift
//  StuentManagementSystem
//
//  Created by Nazim Uddin on 10/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class CollegeListViewController: UIViewController {


    @IBOutlet weak var collegeListView: UITableView!
    var collegeData = [College]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "College List"
        collegeData = DatabaseManager.shareInstance.getAllCollegeInfo()
    }
    override func viewWillAppear(_ animated: Bool) {
        collegeData = DatabaseManager.shareInstance.getAllCollegeInfo()
        collegeListView.reloadData()
    }
    @IBAction func btnCollegeAddClick(_ sender: UIBarButtonItem) {
        let collegeForm:CollegeFormViewController = storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        navigationController?.pushViewController(collegeForm, animated: true)
    }
    
}
extension CollegeListViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collegeData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CollegeListCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CollegeListCell
        cell.college = collegeData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let collegeDetailViewController = storyboard?.instantiateViewController(withIdentifier: "CollegeDetailViewController") as! CollegeDetailViewController
        collegeDetailViewController.collegeDetail = collegeData[indexPath.row]
        collegeDetailViewController.indexRow = indexPath.row
        self.navigationController?.pushViewController(collegeDetailViewController, animated: true)
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            collegeData = DatabaseManager.shareInstance.deleteCollegeInfo(index: indexPath.row)
            collegeListView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

