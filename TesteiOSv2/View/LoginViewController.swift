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
    
    var cliente: Cliente?
      
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
        if segue.identifier == "AccountSegue" {
//            if let destination = segue.destination as? CurrencyViewController {
//                destination.cliente = self.cliente 
//            }
        }
    }
    
    @IBAction func LoginClicked(_ sender: Any) {
        
        var loginManager = LoginManager()
        loginManager.delegate = self
        let userLogin = UserLogin(login: txtLogin.text ?? "", password: txtPassword.text ?? "", message: "")
        
        if  !loginManager.tratarLogin(user: userLogin) {
            lblAlert.text = userLogin.message
            lblAlert.isHidden = false
        }
    }
}

extension LoginViewController: LoginManagerDelegate {
    func didUpdateLogin (cliente: Cliente) {
        DispatchQueue.main.async {
            self.lblAlert.isHidden = true
            self.cliente = cliente
  //          self.performSegue(withIdentifier: "CurrencySegue", sender: nil)
        }
    }
       
    func didLoginError(error: Error){
       
        DispatchQueue.main.async {
            self.lblAlert.text = "User ou Password inválidos, tente novamente."
            self.lblAlert.isHidden = false
        }

    }
}

