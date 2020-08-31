//
//  DatabaseController.swift
//  CRUDProject
//
//  Created by Marco Antonio on 30/08/20.
//  Copyright © 2020 Marco. All rights reserved.
//

import Foundation

class ClientController {
    
    let database = DatabaseController()
    
    func validateForm(name:String,phone:String,cpf:String) -> Bool{
        
        if name.isEmpty {
            return false
        } else if phone.isEmpty {
            return false
        } else if cpf.isEmpty {
            return false
        }
        
        return true
    }
    
    func saveClient(name:String,phone:String,cpf:String,birthday:String,gender:String){
        
        database.createClient(name: name, phone: phone, cpf: cpf, birthday: birthday, gender: gender)
    }
    
    func getClients() -> [Any]{
        let clients = database.retrieveClients()
        
        if clients.count != 0 {
            return clients
        } else {
            return []
        }

    }
    
    func getBirthday(birthdate:String) -> String{
        let dateFormater = DateFormatter()
           dateFormater.dateFormat = "dd/MM/YYYY"
           let dateOfBirth = dateFormater.date(from: birthdate)

           let calender = Calendar.current

           let dateComponent = calender.dateComponents([.year, .month, .day], from:
           dateOfBirth!, to: Date())

        guard let stringBirthday = dateComponent.year?.description else { return "" }
        
        return stringBirthday
    }
    
}
