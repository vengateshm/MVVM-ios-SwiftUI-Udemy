//
//  ErrorView.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation
import SwiftUI

struct ErrorView: View {
    let errorMsg:String
    var body: some View {
        Text(errorMsg)
    }
}
