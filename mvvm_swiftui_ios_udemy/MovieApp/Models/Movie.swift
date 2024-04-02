//
//  Movie.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation

struct MovieResponse : Codable {
    let movies:[Movie]
    
    private enum CodingKeys : String, CodingKey {
        case movies = "Search"
    }
}

struct Movie : Codable {
    let title:String
    let year :String
    let imdbId:String
    let poster:String
    
    private enum CodingKeys : String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
    }
}
