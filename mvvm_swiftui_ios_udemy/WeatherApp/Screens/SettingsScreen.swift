//
//  SettingsScreen.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 02/01/24.
//

import Foundation
import SwiftUI

extension TemperatureUnit {
    var displayText : String {
        switch self {
            case .celsius:
                return "Celcius"
            case .fahrenheit:
                return "Fahrenheit"
            case .kelvin:
                return "Kelvin"
        }
    }
}

struct SettingsScreen : View {
    
//    @State private var selectedUnit : TemperatureUnit = .kelvin
    @Environment(\.presentationMode) private var presentationMode
    @AppStorage("unit") private var selectedUnit : TemperatureUnit = .kelvin
    @EnvironmentObject var store: Store
    var body : some View {
        VStack{
            Picker(selection: $selectedUnit, label: Text("Select Temperature unit?")){
                ForEach(TemperatureUnit.allCases, id: \.self){
                    Text("\($0.displayText)" as String)
                }
            }.pickerStyle(SegmentedPickerStyle())
            Spacer()
        }
        .navigationTitle("Settings")
        .navigationBarItems(trailing: Button("Done"){
            store.selectedUnit = selectedUnit
            presentationMode.wrappedValue.dismiss()
        })
        .embedInNavigationView()
    }
}

#Preview {
    SettingsScreen()
}
