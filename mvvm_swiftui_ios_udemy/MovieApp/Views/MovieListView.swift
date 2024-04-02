//
//  MovieListView.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation
import SwiftUI

struct MovieListView: View {
    let movies:[MovieUiModel]
    var handleTap: (String) -> Void
    var body: some View {
        List(self.movies, id: \.imdbId){movie in
//            MovieCell(movie: movie){ imdbId in
//                self.handleTap(imdbId)
//            }
            NavigationLink(destination: MovieDetailScreen(imdbId: movie.imdbId)) {
                MovieCell(movie: movie){imdbId in 
                    self.handleTap(imdbId)
                }
            }
        }
    }
}

struct MovieCell : View {
    let movie:MovieUiModel
    var handleTap: (String) -> Void
    var body: some View{
        HStack(alignment:.top){
            RemoteImageView(url: movie.poster, imageSize: CGSize(width: 100, height: 180))
            VStack(alignment: .leading) {
                Text(movie.title).font(.headline)
                Text(movie.year).opacity(0.5).padding(.top, 10)
            }.padding(5)
            Spacer()
        }.contentShape(Rectangle())
            .onTapGesture {
                self.handleTap(movie.imdbId)
            }
    }
}
