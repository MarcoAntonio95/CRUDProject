//
//  RegisterViewController.swift
//  CRUDProject
//
//  Created by Marco Antonio on 30/08/20.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nameTextfield: UITextField!
    
    @IBOutlet weak var phoneTextfield: UITextField!
    
    @IBOutlet weak var cpfTextfield: UITextField!

    @IBOutlet weak var birthDatepicker: UIDatePicker!
    
    @IBOutlet weak var genderPicker: UIPickerView!
    
    let registerController = ClientController()
    
    var gendersArray:[String] = []
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
        self.genderPicker.delegate = self
        self.genderPicker.dataSource = self
        gendersArray = ["Masculino", "Feminino"]
       }
    
    @IBAction func save(_ sender: Any) {
        let name = nameTextfield.text ?? ""
        let phone = phoneTextfield.text ?? ""
        let cpf = cpfTextfield.text ?? ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let barthday = dateFormatter.string(from: birthDatepicker.date)
        
        let gender = gendersArray[genderPicker.selectedRow(inComponent: 0)]
       
        if registerController.validateForm(name: name, phone: phone, cpf: cpf){
            registerController.saveClient(name: name, phone: phone, cpf: cpf, birthday: barthday, gender: gender)
            
            showAlert(tittle: "Sucesso", message: "Seu cadastro foi salvo com sucesso")

        } else {
            showAlert(tittle: "Erro", message: "Nenhum dos campos pode estar vazio.")
        }
     
    
    }
    
    func showAlert(tittle:String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

          alert.addAction(UIAlertAction(title: "Entendi", style: UIAlertAction.Style.default, handler: nil))

          self.present(alert, animated: true, completion: nil)
    }
    
    
}
extension RegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gendersArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return gendersArray[row]
       }
}

