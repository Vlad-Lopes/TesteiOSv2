//
//  LoginManager.swift
//  TesteiOSv2
//
//  Created by Vlad Lopes on 10/02/21.
//

import Foundation
//import CoreLocation
import CPF_CNPJ_Validator

protocol LoginManagerDelegate {
    func didUpdateLogin(cliente: Cliente)
    
    func didLoginError(error: Error)
}

struct LoginManager {

 //   var user: UserLogin
    
    func tratarLogin(user: UserLogin) -> Bool{
        if LoginValidate().validaLogin(user: user) {
            setLogin(login: user.login)
//            if requestLogin(user: user) {
//                return true
//            } else {
//                user.setMessage(message: LoginError.invalid.getErroLogin())
//                return false
//            }
        } else {
            return false
        }
        
        requestLogin(user: user)
        
        return true
    }
  
    var delegate: LoginManagerDelegate?
    
    func requestLogin (user: UserLogin) {
      
        let urlString = "https://bank-app-test.herokuapp.com/api/login"
        
        let json: [String: Any] = ["user": user.login, "password": user.password]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.httpBody = jsonData

            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    self.delegate?.didLoginError(error: error!)
                    return
                }
                if let safeData = data {
                    if let info = self.parseJSON(infoData: safeData) {
                        self.delegate?.didUpdateLogin(cliente: info)
                    } 
                }
            }
            task.resume()
        }
       
//        else {
//            return false
//        }
//        return true
    }

    func parseJSON(infoData: Data) -> Cliente? {
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(UserData.self, from: infoData)

            let id = decoderData.userAccount.userId
            let nome = decoderData.userAccount.name
            let conta = decoderData.userAccount.bankAccount
            let agencia = decoderData.userAccount.agency
            let saldo = decoderData.userAccount.balance
            let cliente = Cliente(clientId: id, name: nome, bankAccount: conta, agency: agencia, balance: saldo)
            return cliente
        } catch {
            print(error.localizedDescription)
            self.delegate?.didLoginError(error: error)
            return nil
        }
    }
}
           
            
            
            
//            var postRequest = URLRequest(url: url)
//            postRequest.httpMethod = "POST"
//            postRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            postRequest.addValue("application/json", forHTTPHeaderField: "Accept")
//
//            let teste = ["nome": "meunome", "senha": "minhasenha"]
//            do {
//                    postRequest.httpBody = try JSONSerialization.data(withJSONObject: teste, options: .prettyPrinted)
//                } catch let error {
//                    self.delegate?.didFailWithError(error: error)
//                    return
//                }
//
//            let task = session.dataTask(with: postRequest) { (data, response, error) in
//                if error != nil {
//                    self.delegate?.didFailWithError(error: error!)
//                    return
//                }
//                if let safeData = data {
//                    if let info = self.parseJSON(infoData: safeData) {
//                        self.delegate?.didUpdateLogin(cliente: info)
//                        print("pelo menos voltou", info)
//                    }
//                }
//            }
//
//            task.resume()
//        }
//    }
//
//    func parseJSON(infoData: Data) -> Client? {
//        let decoder = JSONDecoder()
//        do {
//            let decoderData = try decoder.decode(UserData.self, from: infoData)
//            let id = decoderData.userAccount.userId
//            let nome = decoderData.userAccount.name
//            let conta = decoderData.userAccount.bankAccount
//            let agencia = decoderData.userAccount.agency
//            let saldo = decoderData.userAccount.balance
//            let cliente = Client(clientId: 15, name: "nome", bankAccount: "conta", agency: "agencia", balance: 3000)
//
//            return cliente
//        } catch {
//            self.delegate?.didFailWithError(error: error)
//            return nil
//        }
//    }
    
//    func prepararJson() -> String {
//        let teste = ["nome": "meunome", "senha": "minhasenha"]
//
//        do {
//                var json = try JSONSerialization.data(withJSONObject: teste, options: .prettyPrinted) // pass dictionary to data object and set it as request body
//                return json
//            } catch let error {
//                self.delegate?.didFailWithError(error: error)
//                return ""
//            }
//    }
//}

//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else{
//                print(error?.localizedDescription ?? "No data")
//                return
//            }
//        let safeData = data
//            if let info = self.parseJSON(infoData: safeData) {
//                self.delegate?.didUpdateLogin(cliente: info)
//            }

//    func performRequest(urlString: String){
//        if let url = URL(string: urlString) {
//  print(url)
//            let session = URLSession(configuration: .default)
//
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if error != nil {
//                    self.delegate?.didFailWithError(error: error!)
//                    return
//                }
//                if let safeData = data {
//                    if let info = self.parseJSON(infoData: safeData) {
//                        self.delegate?.didUpdateLogin(cliente: info)
//                    }
//                }
//            }
//
//            task.resume()
//        }
//    }
//


