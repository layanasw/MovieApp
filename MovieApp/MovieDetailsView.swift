//
//  MovieDetailsView.swift
//  MovieApp
//
//  Created by layan alwasaidi on 27/01/2025.
//
import SwiftUI

struct MovieDetailsView: View {
    let movie: MovieFields

    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomLeading) {
                // Full-Screen Poster
                AsyncImage(url: URL(string: movie.poster)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, minHeight: 450, maxHeight: 450) // Adjust height as needed
                        .clipped()
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(maxWidth: .infinity, minHeight: 400, maxHeight: 400)
                }

                // Movie Title on Top of the Poster
                Text(movie.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: 400) // Ensures poster stays at the top

            // Details Below the Poster
            VStack(alignment: .leading, spacing: 20) {
                // Movie Details Grid
                VStack(spacing: 20) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Duration")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(movie.runtime)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Language")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(movie.language.joined(separator: ", "))
                                .foregroundColor(.gray)
                        }
                    }

                    HStack {
                        VStack(alignment: .leading) {
                            Text("Genre")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(movie.genre.first ?? "N/A") // Only the first genre
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Age")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(movie.rating)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.horizontal)

                // Movie Story
                VStack(alignment: .leading, spacing: 10) {
                    Text("Story")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text(movie.story)
                        .foregroundColor(.white)
                        .lineSpacing(5)
                }
                .padding(.horizontal)

                // IMDb Rating Section
                VStack(alignment: .leading, spacing: 5) {
                    Text("IMDb Rating")
                        .font(.headline)
                        .foregroundColor(.white)

                    Text("\(movie.IMDb_rating)/10")
                        .font(.title3)
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                        .padding(.bottom, 8)

                    // iOS Line Under IMDb Rating
                    Divider()
                        .background(Color.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

                Spacer()
            }
        }
        .background(Color.black.ignoresSafeArea())
    }
}
