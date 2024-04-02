//
//  String+Extensions.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 02/01/24.
//

import Foundation

extension String {
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
    func trimAndEscape()->String {
        let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
