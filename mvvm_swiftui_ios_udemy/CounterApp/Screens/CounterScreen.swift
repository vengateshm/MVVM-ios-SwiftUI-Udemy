//
//  CounterScreen.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation
import SwiftUI

struct CounterScreen : View {
    
    @ObservedObject private var counterVM : CounterViewModel
    
    init() {
        self.counterVM = CounterViewModel()
    }
    
    var body: some View {
        VStack{
            Text(counterVM.isPremium ? "PREMIUM" : "")
                .frame(width: 200, height: 100)
                .font(.largeTitle)
                .foregroundColor(.green)

            CountView(count: counterVM.count)
            Button("Increment") {
                self.counterVM.increment()
            }
            .padding()
                        .foregroundColor(.white)
                        .background(counterVM.isPremium ? Color.purple : Color.blue)
                        .cornerRadius(8)
        }
    }
}

struct CountView: View {
    let count: Int
    
    var body: some View {
        Text("\(count)")
            .font(.title)
    }
}
