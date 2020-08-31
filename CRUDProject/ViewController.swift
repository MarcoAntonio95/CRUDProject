//
//  ViewController.swift
//  CRUDProject
//
//  Created by Marco Antonio on 30/08/20.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func exit(_ sender: Any) {
        //Única maneira de fechar a aplicação, mas não é recomendado pela Apple e não será aceito pela App Store caso possua este código.
        exit(0);
    }
    
}

