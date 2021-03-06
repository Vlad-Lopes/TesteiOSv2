//
//  AccountScenePresenter.swift
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

protocol AccountScenePresentationLogic
{
    func presentClient(response: AccountScene.SetClient.Response)
    func presentStatements(response: AccountScene.Statements.Response)
    func noStatements()
}

class AccountScenePresenter: AccountScenePresentationLogic
{
  weak var viewController: AccountSceneDisplayLogic?
    
    let formatador = NumberFormatter()
  
  // MARK: Show account data
  
    func presentClient(response: AccountScene.SetClient.Response)
    {
        formatador.locale = Locale(identifier: "pt_BR")
        formatador.numberStyle = .currency

        // MARK: Bank account and agency has these contents changed
        var agency = response.client.agency
        agency.insert(".", at: agency.index(agency.startIndex, offsetBy: 2))
        agency.insert("-", at: agency.index(agency.startIndex, offsetBy: 8))

        let name = response.client.name
        let bankAccount = "\(response.client.bankAccount) / \(agency) "
        let balance = formatador.string(from: NSNumber(value: response.client.balance))!
        
        let viewModel = AccountScene.SetClient.ViewModel(name: name, account: bankAccount, balance: balance)
        viewController?.displayClient(viewModel: viewModel)
      }
    
    // MARK: Show statements
    
    func presentStatements(response: AccountScene.Statements.Response)
    {
        var accounts: [AccountData] = []
        for sta in response.statements {
            let value = formatador.string(from: NSNumber(value: sta.value))!
            let account = AccountData(title: sta.title, date: sta.date, description: sta.desc, value: String(value))
            accounts.append(account)
        }
        
        let viewModel = AccountScene.Statements.ViewModel(statements: accounts)
        viewController?.displayStatements(viewModel: viewModel)
    }
    
    func noStatements() {
        let account = AccountData(title: "", date: "", description: "", value: "")
       
        let viewModel = AccountScene.Statements.ViewModel(statements: [account])
        viewController?.displayStatements(viewModel: viewModel)
    }
}
