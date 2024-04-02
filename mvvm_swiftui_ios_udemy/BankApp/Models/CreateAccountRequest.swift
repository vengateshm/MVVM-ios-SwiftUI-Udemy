//
//  CreateAccountRequest.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation

struct CreateAccountRequest : Codable {
    let name : String
    let accountType : String
    let balance : Double
}
