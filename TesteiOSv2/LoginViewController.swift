//
//  ViewController.swift
//  TesteiOSv2
//
//  Created by Vlad Lopes on 09/02/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtLogin: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblAlert: UILabel!
    @IBOutlet weak var bttLogin: UIButton!
    
    var cliente = Cliente(clientId: 5, name: "Vlad", bankAccount: "12345", agency: "789", balance: 3000.45)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bttLogin.layer.cornerRadius = 8
 //       clearLogin(key: "TesteiOSv2")
        txtLogin.text = getLogin()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        txtPassword.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CurrencySegue" {
            if let destination = segue.destination as? CurrencyViewController {
                DispatchQueue.main.async {
                    destination.cliente = self.cliente
                }
            }
        }
    }
    
    @IBAction func LoginClicked(_ sender: Any) {
        let userLogin = UserLogin(login: txtLogin.text ?? "", password: txtPassword.text ?? "", message: "")
        let isValid = LoginManager(user: userLogin).tratarLogin()
        
        if  isValid {
            var loginManager = LoginManager(user: userLogin)
            loginManager.delegate = self
        
            lblAlert.isHidden = true
            
            performSegue(withIdentifier: "CurrencySegue", sender: nil)
        } else {
            lblAlert.text = userLogin.message
            lblAlert.isHidden = false
        }
    }
}

extension LoginViewController: LoginManagerDelegate {
    func didUpdateLogin (cliente: Cliente) {
        DispatchQueue.main.async {
            self.cliente = cliente
           }
       }
       
    func didFailWithError(error: Error){
           print(error)
       }
}

