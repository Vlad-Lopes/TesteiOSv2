//
//  UserModel.swift
//  TesteiOSv2
//
//  Created by Vlad Lopes on 09/02/21.
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

struct Account {
    var tipo: String
    var data: String
    var ident: String
    var valor: Double
}

struct Cliente {
    var clientId: Int
    var name: String
    var bankAccount: String
    var agency: String
    var balance: Double
}

struct UserData: Decodable {
    var userAccount: Detail
}

struct Detail: Decodable {
    var userId: Int
    var name: String
    var bankAccount: String
    var agency: String
    var balance: Double
}

struct StatementData: Decodable {
    var statementList: [Statement]
}

struct Statement: Decodable {
    var title: String
    var desc: String
    var date: String
    var value: Double
}


