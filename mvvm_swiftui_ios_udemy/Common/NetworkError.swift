//
//  NetworkError.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation

enum NetworkError : Error {
    case badUrl
    case decodingError
    case noData
}
