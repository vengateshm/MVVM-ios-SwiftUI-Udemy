//
//  MovieDetailViewModel.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation

class MovieDetailViewModel : BaseViewModel {
    var movieDetail : MovieDetail?
    let movieService = MovieService()
    
    init(movieDetail: MovieDetail? = nil) {
        self.movieDetail = movieDetail
    }
    
    func getDetailsByImdbId(imdbId:String) {
        self.uiState = .loading
        movieService.getMovieDetailsBy(imdbId: imdbId){result in
            switch result {
            case .success(let details):
                DispatchQueue.main.async {
                    self.movieDetail = details
                    self.uiState = .success
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.uiState = .failure
                }
            }
        }
    }
    
    var title: String {
            self.movieDetail?.title ?? ""
        }
        
        var poster: String {
            self.movieDetail?.poster ?? ""
        }
        
        var plot: String {
            self.movieDetail?.plot ?? ""
        }
        
        var rating: Int {
            get {
                let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
                return Int(ceil(ratingAsDouble ?? 0.0))
            }
        }
        
        var director: String {
            self.movieDetail?.director ?? ""
        }

}
