//
//  LoginValidate.swift
//  TesteiOSv2
//
//  Created by Vlad Lopes on 11/02/21.
//

import Foundation
import CPF_CNPJ_Validator

//struct LoginValidate {
//    func validaLogin(user: UserLogin) -> Bool {
//        if user.login .isEmpty {
//            user.setMessage(message: LoginError.noUser.getErroLogin())
//        } else if NSPredicate(format: "SELF MATCHES %@", "[0-9]+").evaluate(with: user.login) {
//                if !BooleanValidator().validate(cpf: user.login) {
//                    user.setMessage(message: LoginError.wrongCPF.getErroLogin())
//                }
//            } else {
//                if !NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: user.login) {
//                    user.setMessage(message: LoginError.wrongEmail.getErroLogin())
//                }
//            }
//        if user.message != "" {
//            return false
//        }
//        
//        if user.password .isEmpty {
//            user.setMessage(message: LoginError.noPassword.getErroLogin())
//        } else if !testaPassword(passw: user.password) {
//            user.setMessage(message: LoginError.wrongPassword.getErroLogin())
//        }
//
//        if user.message == "" {
//            return true
//        } else {
//            return false
//        }
//    }
//    
//    func testaPassword(passw: String) -> Bool {
//        var upper = false
//        var special = false
//        var normal = false
//        
//        for chr in passw {
//            if chr .isUppercase {
//                upper = true
//                continue
//            }
//            if chr .isLetter || chr .isNumber {
//                normal = true
//                continue
//            }
//            if String(chr).range(of: ".*[^A-Za-z0-9].*", options: .regularExpression) != nil {
//                special = true
//                continue
//            }
//        }
//        
//        if upper  && normal && special {
//            return true
//        } else {
//            return false
//        }
//    }
//    
//}
