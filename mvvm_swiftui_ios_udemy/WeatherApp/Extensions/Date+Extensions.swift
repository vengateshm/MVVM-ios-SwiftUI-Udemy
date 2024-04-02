//
//  Date+Extensions.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 02/01/24.
//

import Foundation

extension Date {
    func formatAsString() ->String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh::mm a"
        return formatter.string(from: self)
    }
}
