//
//  AccountSceneInteractor.swift
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

protocol AccountSceneBusinessLogic
{
    func requestClientFormat(request: AccountScene.SetClient.Request)
    func requestStatements(request: AccountScene.Statements.Request)
}

protocol AccountSceneDataStore
{
    var clientLogged: Client? { get set }
}

class AccountSceneInteractor: AccountSceneBusinessLogic, AccountSceneDataStore
{

  var presenter: AccountScenePresentationLogic?
  var worker: AccountSceneWorker?
    
    var clientLogged: Client?
    
// MARK: Do show client data
    
    func requestClientFormat(request: AccountScene.SetClient.Request) {
        let response = AccountScene.SetClient.Response.init(client: clientLogged!)
        presenter?.presentClient(response: response)
    }
    
// MARK: Get account statements
    
    func requestStatements(request: AccountScene.Statements.Request) {
        let statementWorker = RequestStatementsWorker()
   //     let response: () = statementWorker.requestStatements(id: request.id)
        statementWorker.requestStatements(id: request.id)
        { (response, fail) -> () in
           if fail  {
                self.presenter?.noStatements()
           } else {
                let response = AccountScene.Statements.Response.init(statements: response!)
                self.presenter?.presentStatements(response: response)
           }
        }
    }
}