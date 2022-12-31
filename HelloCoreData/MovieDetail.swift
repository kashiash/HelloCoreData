//
//  MovieDetail.swift
//  HelloCoreData
//
//  Created by Jacek Kosiński G on 31/12/2022.
//""

import SwiftUI

struct MovieDetail: View {
    let movie: Movie
    let storageManager: StorageProvider
    

    @Binding var needsRefresh: Bool
    
    @State private var movieName: String = ""
    @State private var movieTitle: String = ""
    
    var body: some View {
     
        VStack {
            TextField("Name", text: $movieName)
         
            TextField("Title", text: $movieTitle)
            Button("Update") {
                if movieName != "" {
                    movie.title = movieTitle
                    movie.name = movieName
                    storageManager.updateMovie(movie)
                    needsRefresh.toggle()
                }
            }
        }.onAppear{
            self.movieName = movie.name ?? ""
            
            self.movieTitle = movie.title ?? ""
        }
       
    }
}


