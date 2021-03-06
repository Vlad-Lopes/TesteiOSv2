//
//  LoginSceneInteractor.swift
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

protocol LoginSceneBusinessLogic
{
    func readStoredLogin(request: LoginScene.ReadLogin.Request)
    func validateLogin(request: LoginScene.ValidateLogin.Request)
}

protocol LoginSceneDataStore
{
    var clientLogged: Client? { get set }
}

class LoginSceneInteractor: LoginSceneBusinessLogic, LoginSceneDataStore
{
  var presenter: LoginScenePresentationLogic?
  var worker: LoginSceneWorker?
    
    var clientLogged: Client?

  // MARK: Read stored user
  
    func readStoredLogin(request: LoginScene.ReadLogin.Request)
    {
        worker = LoginSceneWorker()
        let storedLogin = worker?.readStoredLogin()
        
        let response = LoginScene.ReadLogin.Response(login: storedLogin!)
        presenter?.presentLogin(response: response)
    }
    
    // MARK: Validate and store user
    
    func validateLogin(request: LoginScene.ValidateLogin.Request) {
        worker = LoginSceneWorker()
        let message = worker?.validateLogin(user: request.login, password: request.password)
        
        if message != "" {
            let response = LoginScene.ValidateLogin.Response(alertMessage: message!)
            presenter?.presentMessage(response: response)
        } else {
            LoginSceneWorker().storeLogin(login: request.login)
                       
            let worker = RequestLoginWorker()
            worker.requestLogin (login: request.login, password: request.password)
            { (response, fail) -> () in
               if fail {
                let responseC = LoginScene.ValidateLogin.Response(alertMessage:       LoginError.invalid.getErroLogin())
                                    self.presenter?.presentMessage(response: responseC)
               } else {
                    self.clientLogged = response!
                    let responseC = SetClient.Response.init(client: response)
                    self.presenter?.presentClient(response: responseC)
               }
            }
        }
    }
}
