//
//  ClientsTableViewController.swift
//  CRUDProject
//
//  Created by Marco Antonio on 30/08/20.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit
import Foundation
import CoreData

struct ClientStruct {
    var name = String()
    var age = String()
}

class ClientsTableViewController: UITableViewController {

    let clientController = ClientController()
    var tableViewData = [ClientStruct]()
    
    override func viewWillAppear(_ animated: Bool) {
        getClients()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let clientCell = tableView.dequeueReusableCell(withIdentifier: "clientcell") as? ClientTableViewCell else { return UITableViewCell()}

        let clientsData = tableViewData[indexPath.section]
        
        clientCell.nameText.text = clientsData.name
        clientCell.ageText.text = clientsData.age

        return clientCell
    }

}

extension ClientsTableViewController{
    func getClients(){
        let clientsObjects = clientController.getClients()
        
        for client in clientsObjects as? [NSManagedObject] ?? []{
            let name = client.value(forKey: "name") as? String ?? ""
            let birthday = clientController.getBirthday(birthdate: client.value(forKey: "birthday") as? String ?? "")
            
            let auxClient = ClientStruct(name: name, age: birthday)
            
            tableViewData.append(auxClient)
        }
    }
}
