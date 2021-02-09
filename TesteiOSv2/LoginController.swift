//
//  ViewController.swift
//  TesteiOSv2
//
//  Created by Vlad Lopes on 09/02/21.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var textUser: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var bttLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bttLogin.layer.cornerRadius = 8
    }

    @IBAction func LoginTouch(_ sender: Any) {
        performSegue(withIdentifier: "CurrencySegue", sender: nil)
    }
    
}

