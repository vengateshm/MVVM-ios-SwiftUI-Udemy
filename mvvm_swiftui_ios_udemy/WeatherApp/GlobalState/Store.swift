//
//  Store.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 02/01/24.
//

import Foundation

class Store : ObservableObject {
    @Published var selectedUnit : TemperatureUnit = .kelvin
    @Published var weatherList : [WeatherUiModel] = [WeatherUiModel]()
    
    init() {
        selectedUnit = UserDefaults.standard.unit
    }
    
    func addWeather(_ weather: WeatherUiModel) {
        weatherList.append(weather)
    }
}
