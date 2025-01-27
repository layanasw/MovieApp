//
//  MovieCenterView.swift
//  MovieApp
//
//  Created by layan alwasaidi on 21/01/2025.
//
import SwiftUI

struct MovieCenterView: View {
    @StateObject private var viewModel = MovieViewModel() // To fetch movies
    @State private var highRatedIndex = 0 // For page control

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // 1. Header with "Movie Center" and Profile Button
                    HStack {
                        Text("Movie Center")
                            .font(.system(size: 33, weight: .bold))
                            .foregroundColor(.white)

                        Spacer()

                        // Profile Button
                        NavigationLink(destination: ProfilePage()) {
                            Circle()
                                .fill(Color.gray) // Placeholder for profile image
                                .frame(width: 40, height: 40)
                                .overlay(Circle().stroke(Color.yellow, lineWidth: 2))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)

                    // 2. Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search for Movie name, actors...", text: .constant(""))
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top, -15)

                    // 3. High Rated Section
                    Text("High Rated")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.top, -5)

                    if viewModel.movies.isEmpty {
                        Text("Loading movies...")
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .onAppear {
                                viewModel.loadMovies()
                            }
                    } else {
                        // High Rated Movies with Page Indicator
                        TabView(selection: $highRatedIndex) {
                            ForEach(viewModel.movies.prefix(10), id: \.name) { movie in
                                HighRatedMovieCard(movie: movie)
                                    .frame(width: 366, height: 434)
                                    .tag(viewModel.movies.firstIndex(where: { $0.name == movie.name }) ?? 0)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                        .frame(height: 450) // Adjust height for the posters and dots
                    }

                    // 4. Drama Section
                    HStack {
                        Text("Drama")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        Spacer()
                        Button(action: {
                            print("Show More Drama Movies tapped")
                        }) {
                            Text("Show more")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.yellow)
                        }
                        .padding(.horizontal)
                    }

                    let dramaMovies = viewModel.movies.filter { $0.genre.contains("Drama") }
                    if !dramaMovies.isEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(dramaMovies.prefix(5), id: \.name) { movie in
                                    DramaMovieCard(movie: movie)
                                        .frame(width: 208, height: 275)
                                }
                            }
                            .padding(.horizontal)
                        }
                    } else {
                        Text("No Drama movies available")
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .background(Color.black.ignoresSafeArea())
        }
    }
}
