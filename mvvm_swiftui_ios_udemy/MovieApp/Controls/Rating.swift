//
//  Rating.swift
//  mvvm_swiftui_ios_udemy
//
//  Created by Vengatesh on 03/01/24.
//

import Foundation
import SwiftUI

struct Rating : View {
    @Binding var rating:Int?
    
    private func starType(index : Int) -> String {
        if let rating = self.rating {
            return index < rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    var body: some View{
        HStack {
            ForEach(1...10, id: \.self){ index in
                Image(systemName: self.starType(index: index))
                    .foregroundColor(.orange)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }
    }
}
