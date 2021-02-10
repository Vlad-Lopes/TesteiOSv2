//
//  AccountManager.swift
//  TesteiOSv2
//
//  Created by Vlad Lopes on 10/02/21.
//

import Foundation
import CoreLocation

protocol AccountManagerDelegate {
    func didUpdateAccount(lancamentos: [Account])
    
    func didFailWithError(error: Error)
}

struct AccountManager {

    let accountURL = "https://bank-app-test.herokuapp.com/api/statements/"
    var delegate: AccountManagerDelegate?
    
//    var lancamentos: [Account] = []
    
    func FetchAccount (id: Int) {
        performRequest(urlString: "\(accountURL)\(String(id))")
    }
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString) {
  
            let session = URLSession(configuration: .default)
    
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let info = self.parseJSON(infoData: safeData) {
                        self.delegate?.didUpdateAccount(lancamentos: info)
                    }
                }
            }

            task.resume()
        }
    }
    
    func parseJSON(infoData: Data) -> [Account]? {
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(StatementData.self, from: infoData)
            let statements = decoderData.statementList
            var lancamentos: [Account] = []
            for statement in statements {
                let tipo = statement.title
                let data = statement.date
                let ident = statement.desc
                let valor = statement.value
                let account = Account(tipo: tipo, data: data, ident: ident, valor: valor)
                lancamentos.append(account)
            }

            return lancamentos
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

