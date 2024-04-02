//
//  Account.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation

enum AccountType : String, Codable, CaseIterable {
    case checking
    case saving
}

extension AccountType {
    var title:String {
        switch self {
        case .checking:
            return "Checking"
        case .saving:
            return "Saving"
        }
    }
}

struct Account : Codable {
    var id:UUID
    var name:String
    let accountType:AccountType
    var balance:Double
}
