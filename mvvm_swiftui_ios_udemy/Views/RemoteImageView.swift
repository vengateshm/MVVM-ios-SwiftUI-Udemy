//
//  RemoteImageView.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation

import SwiftUI

struct RemoteImageView: View {
    let url: String
    let imageSize: CGSize

    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                ProgressView().progressViewStyle(CircularProgressViewStyle())
//                Image(systemName: "placeholder")
//                    .resizable()
//                    .scaledToFit()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
            @unknown default:
                fatalError()
            }
        }
        .frame(width: imageSize.width, height: imageSize.height)
    }
}
