//
//  LoginLocal.swift
//  TesteiOSv2
//
//  Created by Vlad Lopes on 11/02/21.
//

import Foundation

let userDefault = UserDefaults.standard

func setLogin(login: String) {
    userDefault.setValue(login, forKey: "TesteiOSv2")
}

func getLogin() -> String {
    let login = userDefault.string(forKey: "TesteiOSv2") ?? ""
    
    return login
}

func clearLogin(key: String) {
    userDefault.removeObject(forKey: key)
}


