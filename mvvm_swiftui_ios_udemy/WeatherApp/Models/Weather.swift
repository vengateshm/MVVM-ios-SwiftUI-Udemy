//
//  Weather.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 02/01/24.
//

import Foundation

struct WeatherResponse : Decodable {
    let cityName: String
    var weather: Weather
    let icon: [WeatherIcon]
    let sys: Sys
    
    private enum CodingKeys: String, CodingKey {
        case cityName = "name"
        case weather = "main"
        case icon = "weather"
        case sys = "sys"
    }
    
    private enum WeatherKeys: String, CodingKey {
        case temperature = "temp"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cityName = try container.decode(String.self, forKey: .cityName)
        self.icon = try container.decode([WeatherIcon].self, forKey: .icon)
        self.sys = try container.decode(Sys.self, forKey: .sys)
        let weatherContainer = try container.nestedContainer(keyedBy: WeatherKeys.self, forKey: .weather)
        let temperature = try weatherContainer.decode(Double.self, forKey: .temperature)
        self.weather = Weather(city: cityName, temperature: temperature, icon: icon.first?.icon ?? "", sunrise: sys.sunrise, sunset: sys.sunset)
    }
}

struct Sys : Decodable {
    let sunrise: Date
    let sunset: Date
    
    enum CodingKeys: String, CodingKey {
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let sunriseTimeInterval = try container.decode(Int32.self, forKey: .sunrise)
        let sunsetTimeInterval = try container.decode(Int32.self, forKey: .sunset)
        self.sunrise = Date(timeIntervalSince1970: TimeInterval(sunriseTimeInterval))
        self.sunset = Date(timeIntervalSince1970: TimeInterval(sunsetTimeInterval))
    }
}

struct Weather: Decodable {
    let city: String
    let temperature: Double
    let icon: String
    let sunrise: Date
    let sunset: Date
}

struct WeatherIcon : Decodable {
    let main: String
    let description: String
    let icon: String
}
