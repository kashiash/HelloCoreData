//
//  MovieDetail.swift
//  HelloCoreData
//
//  Created by Jacek Kosiński G on 31/12/2022.
//

import SwiftUI

struct MovieDetail: View {
    let movie: Movie
    let storageManager: StorageProvider
    @State private var movieName: String = ""
    @State private var movieTitle: String = ""
    @Binding var needsRefresh: Bool
    

    var body: some View {
        VStack {
            TextField(movie.name ?? "", text: $movieName)
            TextField(movie.title ?? "", text: $movieTitle)
            Button("Update") {
                if movieName != "" {
                    movie.title = movieTitle
                    movie.name = movieName
                    storageManager.updateMovie(movie)
                    needsRefresh.toggle()
                }
            }
        }
    }
}


