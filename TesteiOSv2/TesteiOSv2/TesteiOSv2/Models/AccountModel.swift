//
//  AccountModelModels.swift
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

struct Statement {
    var title: String
    var date: String
    var desc: String
    var value: Double

}

struct AccountData {
    var title: String
    var date: String
    var description: String
    var value: String
}

struct UserData: Decodable {
    var userAccount: UserDetail
}

struct UserDetail: Decodable {
    var userId: Int
    var name: String
    var bankAccount: String
    var agency: String
    var balance: Double
}

struct Account {
    var tipo: String
    var data: String
    var ident: String
    var valor: Double
}

struct StatementData: Decodable {
    var statementList: [StatementDetail]
}

struct StatementDetail: Decodable {
    var title: String
    var desc: String
    var date: String
    var value: Double
}

