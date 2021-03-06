//
//  ClientModelModels.swift
//  TesteiOSv2
//
//  Created by Vlad Lopes on 14/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit


struct Client {
    var clientId: Int
    var name: String
    var bankAccount: String
    var agency: String
    var balance: Double
}

enum LoginError: String {
    case valid = ""
    case noUser = "Digite o CPF ou o email para acessar a Conta."
    case wrongCPF = "CPF digitado não é válido."
    case wrongEmail = "Email digitado não é válido."
    case noPassword = "Digite a Password"
    case wrongPassword = "Password deve ter pelo menos: letra maiúscula e minúscula, número e caracter especial."
    case invalid = "User inválido, verifique login e password."
    
    func getErroLogin() -> String {
        return self.rawValue
    }
}
   
enum SetClient
{
  struct Request
  {
    var login: String
    var password: String
  }
  struct Response
  {
    var client: Client?
  }
  struct ViewModel
  {
    var client: Client?
  }
}

