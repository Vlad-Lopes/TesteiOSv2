//
//  LoginManager.swift
//  TesteiOSv2
//
//  Created by Vlad Lopes on 10/02/21.
//

import Foundation

struct TesteLogin {
    func validaLogin(user: UserLogin) -> Bool {
        if user.login .isEmpty {
            user.errorMessage(msg: 1)
        } else if user.login != "nnn" {
            user.errorMessage(msg: 2)
        } else if user.password .isEmpty {
            user.errorMessage(msg: 3)
        } else if !validaPassword(passw: user.password) {
            user.errorMessage(msg: 4)
        } else if user.password == "yyy" {
            user.errorMessage(msg: 5)
        }
        if user.message == nil {
            return true
        } else {
            return false
        }
    }
    
    func validaPassword(passw: String) -> Bool {
        var upper = false
        var special = false
        var normal = false
        
        for chr in passw {
            if chr .isUppercase {
                upper = true
                continue
            }
            if chr .isLetter || chr .isNumber {
                normal = true
                continue
            }
            if String(chr).range(of: ".*[^A-Za-z0-9].*", options: .regularExpression) != nil {
                special = true
                continue
            }
        }
        
        if upper  && normal && special {
            return true
        } else {
            return false
        }
    }
}
    
    


