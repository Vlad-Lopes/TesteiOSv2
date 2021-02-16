//
//  RequestStatementsWorker.swift
//  TesteiOSv2
//
//  Created by Vlad Lopes on 15/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class RequestStatementsWorker
{
    var statements: [Statement]?
    
    func requestStatements(id: Int, statementResponse: @escaping (_ response: [Statement]?) -> ()) {
//
//    var delegate: AccountManagerDelegate?
//
//    func FetchAccount (id: Int) {
//        performRequest(urlString: "\(accountURL)\(String(id))")
//
//    func performRequest(urlString: String){
        
        let accountURL = "https://bank-app-test.herokuapp.com/api/statements/"
        let urlString =  "\(accountURL)\(String(id))"
        
        if let url = URL(string: urlString) {
  
            let session = URLSession(configuration: .default)
    
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    statementResponse(nil)
                    return
                }
                if let safeData = data {
                    if let info = self.parseJSON(infoData: safeData) {
                        statementResponse(info)
//                        self.statements = info
//                        let interactor = AccountSceneInteractor()
//                        var presenter: AccountScenePresentationLogic?
//                        interactor.presenter = presenter
//                        var response = AccountScene.Statements.Response(statements: info)
//                    //    response.statements = info
//                        presenter?.presentStatements(response: response)
                        
         //               self.delegate?.didUpdateAccount(lancamentos: info)
                    }
                }
            }

            task.resume()
        }
    }
    
    func parseJSON(infoData: Data) -> [Statement]? {
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(StatementData.self, from: infoData)
            let statements = decoderData.statementList
            var stats: [Statement] = []
            for statement in statements {
                let title = statement.title
                let date = statement.date
                let desc = statement.desc
                let value = statement.value
                let sta = Statement(title: title, date: date, desc: desc, value: value)
                stats.append(sta)
            }

            return stats
        } catch {
     //       self.delegate?.didAccountError(error: error)
            return nil
        }
    }
}