//
//  ViewController.swift
//  TesteiOSv2
//
//  Created by Vlad Lopes on 09/02/21.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var txtLogin: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblAlert: UILabel!
    @IBOutlet weak var bttLogin: UIButton!
    
    var testaLogin = TesteLogin()
    var error = LoginError.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bttLogin.layer.cornerRadius = 8
    }
    
    override func viewWillAppear(_ animated: Bool) {
        txtPassword.text = ""
    }
    
    @IBAction func LoginClicked(_ sender: Any) {
        var userLogin = UserLogin(login: txtLogin.text ?? "", password: txtPassword.text ?? "")

        if  testaLogin.validaLogin(user: userLogin) {
            lblAlert.isHidden = true
            performSegue(withIdentifier: "CurrencySegue", sender: nil)
        } else {
            lblAlert.text = userLogin.message
            lblAlert.isHidden = false
        }
        
    }
}

