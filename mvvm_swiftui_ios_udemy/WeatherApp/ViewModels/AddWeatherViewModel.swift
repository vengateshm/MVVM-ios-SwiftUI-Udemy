//
//  AddWeatherViewModel.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 02/01/24.
//

import Foundation

class AddWeatherViewModel: ObservableObject {
    var city: String = ""
    
    func save(completion: @escaping (WeatherUiModel) -> Void) {
        WeatherService().getWeatherByCity(city: city) { result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    completion(WeatherUiModel(weather: weather))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    
                }
            }
        }
    }
}

struct WeatherUiModel {
    let weather: Weather
    
    let id = UUID()
    
    var temperature : Double {
        weather.temperature
    }
    
    var city : String {
        weather.city
    }
    
    var icon : String {
        weather.icon
    }
    
    var sunrise : Date {
        weather.sunrise
    }
    
    var sunset : Date {
        weather.sunset
    }
    
    // Default is kelvin from api
    func getTemperatureByUnit(unit: TemperatureUnit) -> Double {
            switch unit {
                case .kelvin:
                    return weather.temperature
                case .celsius:
                    return weather.temperature - 273.15
                case .fahrenheit:
                    return 1.8 * (weather.temperature - 273) + 32
            }
        }
}
