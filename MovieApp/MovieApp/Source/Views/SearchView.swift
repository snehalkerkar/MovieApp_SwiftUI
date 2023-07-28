//
//  SearchView.swift
//  MovieApp
//
//  Created by Snehal Kerkar on 27/07/23.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var searching = false

    @EnvironmentObject var movieViewModel: MovieViewModel

    var body: some View {
        NavigationView {
            VStack {
                if movieViewModel.showError {
                    VStack {
                        Image(systemName: "exclamationmark.icloud.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 34.0, height: 34.0)
                            .foregroundColor(.accentColor)
                        Text("There are no movies that matched your query.")
                            .font(.callout)
                            .foregroundColor(.red)
                    }
                } else {
                    List {
                        ForEach(movieViewModel.movies, id: \.self) { movie in
                            MovieRowView(movie: movie)
                        }.padding(.vertical, 8)
                    }
                    
                }

            }
            .searchable(text: $searchText, prompt: "Search for a movie")
            .onSubmit(of: .search, {
                movieViewModel.searchMovie(name: searchText)
            })
            .navigationTitle("Movies")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(
                MovieViewModel(
                    movieService: MovieService(networkManager: NetworkManager())
                )
            )
    }
}
