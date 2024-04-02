//
//  MovieDetailScreen.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation
import SwiftUI

struct MovieDetailScreen: View {
    
    let imdbId: String
    @ObservedObject var movieDetailVM = MovieDetailViewModel()
    
    var body: some View {
        VStack {
            
            if movieDetailVM.uiState == .loading {
                LoadingView()
            } else if movieDetailVM.uiState == .success {
                MovieDetailView(movieDetailVM: movieDetailVM)
            } else if movieDetailVM.uiState == .failure {
                ErrorView(errorMsg: "Failed to load details.")
            }
            
        }
        
        .onAppear {
            self.movieDetailVM.getDetailsByImdbId(imdbId: self.imdbId)
        }
    }
}


