//
//  Counter.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation

struct Counter {
    var value : Int = 0
    var isPremium : Bool = false
    
    mutating func increment() {
        value = value + 1
        
        isPremium = value.isMultiple(of: 5)
    }
}
