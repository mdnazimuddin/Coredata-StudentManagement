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
