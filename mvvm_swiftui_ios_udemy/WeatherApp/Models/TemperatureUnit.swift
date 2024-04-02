//
//  TemperatureUnit.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 02/01/24.
//

import Foundation

enum TemperatureUnit : String, Identifiable, CaseIterable {
    var id:String {
        return rawValue
    }
    case celsius
    case fahrenheit
    case kelvin
}
