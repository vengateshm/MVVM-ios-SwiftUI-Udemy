//
//  TransferFundRequest.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 02/04/24.
//

import Foundation

struct TransferFundRequest : Codable {
    let accountFromId: String
    let accountToId: String
    let amount: Double
} 
