//
//  ContentView.swift
//  HelloCoreData
//
//  Created by Jacek Kosiński G on 30/12/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    let storageProvider: StorageProvider
    @State var movieName = ""
    @State var movieTitle = ""
    @State var movies: [Movie] = []
    @State private var needsRefresh: Bool = false

    var body: some View {
        NavigationView{
            VStack {
                Text("Add a movie")
                    .font(.title)
                    .padding()
                
                TextField("Movie name", text: $movieName)
                    .padding()
                TextField("Movie title", text: $movieTitle)
                    .padding()
                
                HStack {
                    Button("Save movie") {
                        storageProvider.saveMovie(named:  movieName,title: movieTitle)
                        movies = storageProvider.getAllMovies()
                    }
                    
                    Spacer()
                    
                    Button("Fetch all movies") {
                        movies = storageProvider.getAllMovies()
                    }
                }.padding()
                
                List {
                    ForEach(movies) { (movie: Movie) in
                        NavigationLink(
                            destination: MovieDetail(
                                movie: movie,
                                storageManager:  storageProvider,
                                needsRefresh: $needsRefresh
                            ),
                            label: {
                                Text(movie.name ?? "")
                                Text(movie.title ?? "")
                            }
                        )
                        
                    }.onDelete { rows in
                        for row in rows {
                            let movie = movies[row]
                            storageProvider.deleteMovie(movie)
                        }
                        
                        movies.remove(atOffsets: rows)
                    }
                }
                .accentColor(needsRefresh ? .white : .blue)
                Spacer()
            }
            .padding()
            .onAppear {
                movies = storageProvider.getAllMovies()
            }        }
    }
}


