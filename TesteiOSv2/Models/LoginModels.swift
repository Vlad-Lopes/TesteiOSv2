//
//  LoginModels.swift
//  TesteiOSv2
//
//  Created by Vlad Lopes on 14/02/21.
//

import Foundation

enum LoginError: String {
    case valid = ""
    case noUser = "Digite o CPF ou o email para acessar a Conta."
    case wrongCPF = "CPF digitado não é válido."
    case wrongEmail = "Email digitado não é válido."
    case noPassword = "Digite a Password"
    case wrongPassword = "Password deve ter letras e números e pelo menos uma letra maiúscula."
  
    func getErroLogin() -> String {
        return self.rawValue
    }
}

class UserLogin {
    
    var login: String
    var password: String
    var message: String
    
    init(login: String, password: String, message: String) {
        self.login = login
        self.password = password
        self.message = message
    }
    
    func setMessage(message: String) {
        self.message = message
    }
}

