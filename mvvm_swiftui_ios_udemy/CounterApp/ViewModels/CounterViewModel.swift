//
//  CounterViewModel.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation

class CounterViewModel : ObservableObject {
    
    @Published private var counter = Counter()
    
    var count : Int {
        counter.value
    }
    
    var isPremium : Bool {
        counter.isPremium
    }
    
    func increment() {
        counter.increment()
    }
}
