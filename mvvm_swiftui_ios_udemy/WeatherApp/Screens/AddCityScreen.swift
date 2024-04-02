//
//  AddCityScreen.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 02/01/24.
//

import Foundation
import SwiftUI

struct AddCityScreen : View {
    
    // Used only inside view
    //@State private var city : String = ""
    // Every view updates don't recreate rather use same instance
    // created for the first time
    @StateObject private var addWeatherViewModel = AddWeatherViewModel()
    @EnvironmentObject var store:Store
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack {
            VStack(spacing : 20){
                TextField("Enter City", text: $addWeatherViewModel.city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save"){
                    addWeatherViewModel.save { weatherUiModel in
                        store.addWeather(weatherUiModel)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                .padding(10)
                .frame(maxWidth: UIScreen.main.bounds.width / 4)
                .foregroundColor(.white)
                .background(Color(#colorLiteral(red: 0.1297150552, green: 0.3200980425, blue: 0.8191890121, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }.padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 200)
                .background(Color(#colorLiteral(red: 0.913837254, green: 0.9333122373, blue: 0.9802277684, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            Spacer()
        }
        .navigationTitle("Add City")
        .embedInNavigationView()
    }
}

#Preview {
    AddCityScreen().environmentObject(Store())
}
