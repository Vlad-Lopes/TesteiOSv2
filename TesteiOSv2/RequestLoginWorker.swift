//
//  RequestLoginWorkerWorker.swift
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

class RequestLoginWorker
{
    func requestLogin (login: String, password: String, loginResponse: @escaping (_ response: Client?) -> ()) {
        
        let urlString = "https://bank-app-test.herokuapp.com/api/login"
        
        let json: [String: Any] = ["user": login, "password": password]
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
                    loginResponse(nil)
                    return
                }
                if let safeData = data {
                    if let info = self.parseJSON(infoData: safeData) {
                        loginResponse(info)
                        return
                    } else {
    // Tratar quando der erro
                        print("entrou no else")
                        loginResponse(nil)
                        return
                    }
                }
            }
            
            task.resume()
        }
    }

    func parseJSON(infoData: Data) -> Client? {
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(UserData.self, from: infoData)

            let id = decoderData.userAccount.userId
            let nome = decoderData.userAccount.name
            let conta = decoderData.userAccount.bankAccount
            let agencia = decoderData.userAccount.agency
            let saldo = decoderData.userAccount.balance
            let client = Client(clientId: id, name: nome, bankAccount: conta, agency: agencia, balance: saldo)
            return client
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

}
