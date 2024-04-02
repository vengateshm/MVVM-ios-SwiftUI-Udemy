//
//  LoadingView.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20.0) {
            ProgressView().progressViewStyle(CircularProgressViewStyle())
            Text("Loading...")
        }
    }
}

#Preview {
    LoadingView()
}
