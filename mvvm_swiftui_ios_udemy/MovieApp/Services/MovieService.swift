//
//  MovieService.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation

class MovieService {
    private func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?s=\(name)&apikey=\(Constants.MOVIE_API_KEY)")
    }
    
    private func forMoviesByImdbId(_ imdbId: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?i=\(imdbId)&apikey=\(Constants.MOVIE_API_KEY)")
    }
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?,NetworkError>) -> Void) {
                
        guard let url = forMoviesByName(search) else {
            return completion(.failure(.badUrl))
        }
            
        URLSession.shared.dataTask(with: url) { data, response, error in
                
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
                
            guard let moviesResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            print("---------------------------------------")
            print(moviesResponse)
            print("---------------------------------------")
            completion(.success(moviesResponse.movies))
                
        }.resume()
    }
    
    func getMovieDetailsBy(imdbId: String, completion: @escaping (Result<MovieDetail, NetworkError>) -> Void) {
            
            guard let url = forMoviesByImdbId(imdbId) else {
                return completion(.failure(.badUrl))
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                guard let data = data, error == nil else {
                    return completion(.failure(.noData))
                }
                
                guard let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                    return completion(.failure(.decodingError))
                }
                
                completion(.success(movieDetail))
                
            }.resume()
            
        }
}
