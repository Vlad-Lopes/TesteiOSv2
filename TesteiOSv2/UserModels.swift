//
//  UserModel.swift
//  TesteiOSv2
//
//  Created by Vlad Lopes on 09/02/21.
//

import Foundation

enum LoginError {
    case valid
    case noUser
    case wrongUser
    case noPassword
    case wrongPassword
    case invalid
    
    var message: String {
        switch self {
            case .valid: return ""
            case .noUser: return "Digite o User para acessar a Conta"
            case .wrongUser: return "Digite o email ou o CPF do User."
            case .noPassword: return "Digite a Password"
            case .wrongPassword: return "Password deve ter letras e números e pelo manos uma letra maiúscula"
            case .invalid: return "User ou Password inválidos, tente novamente"
        }
    }
}

class UserLogin {
    
    var login: String
    var password: String
    var message: String?
    
    init(login: String, password: String) {
        self.login = login
        self.password = password
    }
    
    func errorMessage(msg: Int) {
        var textMsg: String
        switch msg {
            case 1: textMsg =  "Digite o User para acessar a Conta"
            case 2: textMsg =  "Digite o email ou o CPF do User."
            case 3: textMsg =  "Digite a Password"
            case 4: textMsg =  "Password deve ter pelo menos uma letra maiúscula, um caracter especial e um alfanumérico"
            case 5: textMsg =  "User ou Password inválidos, tente novamente"
            default: textMsg = ""
        }
        self.message = textMsg
    }
}

struct Account {
    var tipo: String
    var data: String
    var ident: String
    var valor: Double
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


