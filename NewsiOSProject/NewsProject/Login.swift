//
//  Login.swift
//  NewsProject
//
//  Created by QUYTECH_ankit_ios on 15/07/20.
//  Copyright © 2020 QUYTECH. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

public class Login : NSManagedObject,Identifiable {
    @NSManaged public var  email: String?
    @NSManaged public var username: String?
}

extension Login  {
    static func getAllToDoItems() -> NSFetchRequest<Login> {
       
        let request: NSFetchRequest<Login> = Login.fetchRequest() as! NSFetchRequest<Login>
        
       let sortDescriptor = NSSortDescriptor(key: "email", ascending: true)
       request.sortDescriptors = [sortDescriptor]
        
        
        
        return request
    }
    
    func fetchData() {
        let fetchRequest = NSFetchRequest<Login>(entityName: "Login")
        do{
            let fetchResults = try managedObjectContext!.fetch(fetchRequest)
            for item in fetchResults {
                print(item.value(forKey: "email")!)
            }
        }catch let error as NSError {
            print(error.description)
        }
        
        
    }
    
    func deleteRecord() {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
      
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Login>(entityName: "Login")
        
        do{
            let test = try managedContext.fetch(fetchRequest)
            
            let objectToDelete = test[0] as NSManagedObject
            managedContext.delete(objectToDelete)
            
            do{
                try managedContext.save()
            }catch{
             print(error)
            }
            
        }catch{
           print(error)
        }
        
    }

}
    
    
    
//    func deleteRecord() {
//        // Initialize Fetch Request
//        let request: NSFetchRequest<Login> = Login.fetchRequest() as! NSFetchRequest<Login>
//
//        // Configure Fetch Request
//        request.includesPropertyValues = false
//
//        do{
//            let fetchResults =  try managedObjectContext?.fetch(request) as! [Login]
//
//            for item in fetchResults {
//            managedObjectContext?.delete(item)
//            }
//
//            // Save Changes
//           try managedObjectContext?.save()
//        }catch let error as Error {
//            print(error)
//        }
//        }
//
//
//
//
//
//
