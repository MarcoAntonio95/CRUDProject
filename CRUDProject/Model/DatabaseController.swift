//
//  Database.swift
//  CRUDProject
//
//  Created by Marco Antonio on 30/08/20.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DatabaseController {
    
    func createClient(name:String,phone:String,cpf:String,birthday:String,gender:String){
    
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
         
         let managedContext = appDelegate.persistentContainer.viewContext
         
        guard let userEntity = NSEntityDescription.entity(forEntityName: "Client", in: managedContext) else { return }
        
        let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
        
       user.setValue(name, forKeyPath: "name")
       user.setValue(phone, forKey: "phone")
       user.setValue(cpf, forKey: "cpf")
       user.setValue(birthday, forKey: "birthday")
       user.setValue(gender, forKey: "gender")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Erro ao salvar. \(error), \(error.userInfo)")
        }
    }
    
     func retrieveClients() -> [Any]{
        var clients:[Any] = []
        
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return []}
            
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Client")
          
            do {
                let result = try managedContext.fetch(fetchRequest)
                clients = result
            } catch {
                print("Failed")
            }
        
            return clients
        }
    
    
}
