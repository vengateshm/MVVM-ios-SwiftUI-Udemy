//
//  MovieListViewModel.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation

class MovieListViewModel : BaseViewModel {
    @Published var movies = [MovieUiModel]()
    let movieService = MovieService()
    
    func searchByName(_ name:String){
        if name.isEmpty {
            return
        }
        self.uiState = .loading
        movieService.getMoviesBy(search: name.trimAndEscape()){result in
            switch result {
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieUiModel.init)
                        self.uiState = .success
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.uiState = .failure
                }
            }
        }
    }
}

struct MovieUiModel {
    let movie:Movie
    
    var imdbId:String {
        movie.imdbId
    }
    
    var title:String {
        movie.title
    }
    
    var poster:String {
        movie.poster
    }
    
    var year:String {
        movie.year
    }
}
