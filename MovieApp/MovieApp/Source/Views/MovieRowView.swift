//
//  MovieRowView.swift
//  MovieApp
//
//  Created by Snehal Kerkar on 27/07/23.
//

import SwiftUI

struct MovieRowView: View {

    let movie: Movie

    var body: some View {
        HStack {
            let posterURL = URL(string: Constants.baseImageURL + (movie.posterPath ?? ""))
            AsyncImage(url: posterURL) {
                $0
                    .resizable()
                    .frame(width: 104, height: 104)
            } placeholder: {
                Color.gray.opacity(0.1)
            }
            .frame(width: 104)

            VStack(alignment: .leading, spacing: 5) {
                Text(movie.originalTitle)
                Text(movie.releaseDate)
                    .font(.caption)
                    .foregroundColor(Color.black.opacity(0.7))
            }
            .padding(.horizontal, 8)
        }
        .frame(height: 104)
        .listRowInsets(EdgeInsets())
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Movie(
            adult: false,
            backdropPath: "/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg",
            genreIds: [35, 12, 14],
            id: 346698,
            originalLanguage: "en",
            originalTitle: "Barbie",
            overview: "Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.",
            popularity: 5224.37,
            posterPath: "/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg",
            releaseDate: "2023-07-19",
            title: "Barbie",
            video: false,
            voteAverage: 7.572,
            voteCount: 1310
        ))
    }
}

