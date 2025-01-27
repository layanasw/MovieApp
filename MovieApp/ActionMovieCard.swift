//
//  ActionMovieCard.swift
//  MovieApp
//
//  Created by layan alwasaidi on 27/01/2025.
//

import SwiftUI

struct ActionMovieCard: View {
    let movie: MovieFields

    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: movie.poster)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 208, height: 275)
                    .cornerRadius(10)
            } placeholder: {
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 208, height: 275)
                    .cornerRadius(10)
            }
        }
        .onTapGesture {
            print("Action movie tapped: \(movie.name)")
        }
    }
}
