//
//  DatabaseManager.swift
//  StuentManagementSystem
//
//  Created by Nazim Uddin on 10/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit
import CoreData
class DatabaseManager: NSObject {
    
    let contex = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    static let shareInstance = DatabaseManager()
    func saveCollegeInfo(object:[String:String])
    {
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: contex!) as! College
        college.name = object["name"]
        college.address = object["address"]
        college.city = object["city"]
        college.university = object["university"]
        do{
            try contex?.save()
        }catch{
            print("Error Save Data")
        }
    }
    func getAllCollegeInfo() -> [College] {
        var college = [College]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "College")
        do{
            college = try contex?.fetch(fetchRequest) as! [College]
        }catch{
            print("Error get Data")
        }
        return college
    }
    func deleteCollegeInfo(index:Int) -> [College] {
        var college = getAllCollegeInfo()
        contex?.delete(college[index])
        college.remove(at: index)
        do{
            try contex?.save()
        }catch{
            print("Error Delete Info")
        }
        return college
    }
    func updateCollegeInfo(index:Int,object:[String:String]) -> [College]{
        let college = getAllCollegeInfo()
        college[index].name = object["name"]
        college[index].address = object["address"]
        college[index].city = object["city"]
        college[index].university = object["university"]
        do{
            try contex?.save()
        }catch{
            print("Data Did`t Update")
        }
        return college
    }
}

// MARK: Student

extension DatabaseManager{
    
    func saveStudentInfo(object:[String:String], college:College)
    {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: contex!) as! Student
        student.name = object["name"]
        student.email = object["email"]
        student.mobile = object["mobile"]
        student.universities = college
        do{
            try contex?.save()
        }catch{
            print("Error Save Data")
        }
    }
    func getAllStudentInfo() -> [Student] {
        var student = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do{
            student = try contex?.fetch(fetchRequest) as! [Student]
        }catch{
            print("Error get Data")
        }
        return student
    }
    func deleteStudentInfo(index:Int) -> [Student] {
        var student = getAllStudentInfo()
        contex?.delete(student[index])
        student.remove(at: index)
        do{
            try contex?.save()
        }catch{
            print("Error Delete Info")
        }
        return student
    }
    func updateStudentInfo(index:Int,object:[String:String]) -> [Student]{
        let student = getAllStudentInfo()
        student[index].name = object["name"]
        student[index].email = object["email"]
        student[index].mobile = object["mobile"]
        do{
            try contex?.save()
        }catch{
            print("Data Did`t Update")
        }
        return student
    }
}
