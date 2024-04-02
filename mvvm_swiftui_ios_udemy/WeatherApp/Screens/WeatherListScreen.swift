//
//  WeatherListScreen.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 02/01/24.
//

import Foundation
import SwiftUI

enum Sheets : Identifiable {
    var id: UUID {
        return UUID()
    }
    
    case addNewCity
    case settings
}

struct WeatherListScreen : View {
    
    @State private var activeSheet: Sheets?
    @EnvironmentObject var store:Store
    
    var body : some View {
        List{
            ForEach(store.weatherList, id: \.id){ weather in
                WeatherCell(weather:weather)
            }
        }.listStyle(PlainListStyle())
            .sheet(item: $activeSheet, content: {(item) in
                switch item {
                case .addNewCity:
                    AddCityScreen().environmentObject(store)
                case .settings:
                    SettingsScreen().environmentObject(store)
                }
            })
            .navigationTitle("Cities")
            .navigationBarItems(
                leading: Button(action: {
                    activeSheet = .settings
                }, label: {
                    Image(systemName: "gearshape")
                }), trailing: Button(action: {
                    activeSheet = .addNewCity
                }, label: {
                    Image(systemName: "plus")
                }))
            .embedInNavigationView()
    }
}

struct WeatherCell : View {
    
    @EnvironmentObject var store: Store
    
    let weather : WeatherUiModel
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 15){
                Text(weather.city)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                HStack{
                    Image(systemName: "sunrise")
                    Text("\(weather.sunrise.formatAsString())")
                }
                HStack{
                    Image(systemName: "sunset")
                    Text("\(weather.sunset.formatAsString())")
                }
            }
            Spacer()
            RemoteImageView(url: Constants.Urls.weatherUrlAsStringByIcon(icon: weather.icon), imageSize: CGSize(width: 50, height: 50))
            Text("\(Int(weather.getTemperatureByUnit(unit: store.selectedUnit))) \(String(store.selectedUnit.displayText.prefix(1)))")
        }
        .padding()
        .background(Color(#colorLiteral(red: 0.9133135676, green: 0.9335765243, blue: 0.98070997, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
    }
}
