//
//  MovieListScreen.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation
import SwiftUI

struct MovieListScreen : View {
    
    @ObservedObject var movieListViewModel : MovieListViewModel
    @State var movieSearchKeyword : String = ""
    
    init() {
        self.movieListViewModel = MovieListViewModel()
    }
    
    var body : some View {
        VStack{
            TextField("Search", text: $movieSearchKeyword,
                      onEditingChanged: { _ in}, onCommit: {
                self.movieListViewModel.searchByName(self.movieSearchKeyword)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer().navigationBarTitle("Movies")
            
            if movieListViewModel.uiState == .success {
                MovieListView(movies: self.movieListViewModel.movies){ imdb in
                    
                }
            } else if movieListViewModel.uiState == .failure {
                ErrorView(errorMsg: "Oops! Failed to load movies")
            } else if movieListViewModel.uiState == .loading {
                LoadingView()
            }
        }.padding().embedInNavigationView()
    }
}
