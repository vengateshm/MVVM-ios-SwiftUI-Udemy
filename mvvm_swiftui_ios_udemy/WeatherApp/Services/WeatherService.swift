//
//  WeatherService.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 02/01/24.
//

import Foundation

class WeatherService {
    func getWeatherByCity(city: String, completion: @escaping ((Result<Weather, NetworkError>)->Void)) {
        
        guard let weatherURL = Constants.Urls.weatherByCity(city: city) else {
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: weatherURL){ data, _, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                print(weatherResponse.weather)
                completion(.success(weatherResponse.weather))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
