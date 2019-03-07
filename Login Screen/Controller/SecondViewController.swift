//
//  SecondViewController.swift
//  Login Screen
//
//  Created by Ivan Nikitin on 06/03/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //MARK: - ... @IBOutlets
    @IBOutlet var textLable: UILabel!
    
    //MARK: - ... Properties
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = userName {
            textLable.text = name
        }
    }

}
