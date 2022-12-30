//
//  StorageProvider.swift
//  HelloCoreData
//
//  Created by Jacek Kosiński G on 30/12/2022.
//

import Foundation
import CoreData

class StorageProvider {
    let persistentContainer: NSPersistentContainer
    init() {
        persistentContainer = NSPersistentContainer(name: "HelloCoreDataModel")
        
        persistentContainer.loadPersistentStores(completionHandler: {
            description, error in
            if let error = error {
                fatalError("Cos sie spierdolilo w Core Data \(error)")
            }
        })
    }
    func saveMovie(named name: String) {
      let movie = Movie(context: persistentContainer.viewContext)
      movie.name = name

      do {
        try persistentContainer.viewContext.save()
        print("Movie saved succesfully")
      } catch {
        persistentContainer.viewContext.rollback()
        print("Failed to save movie: \(error)")
      }
    }
    
    func getAllMovies() -> [Movie] {
      let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()

      do {
        return try persistentContainer.viewContext.fetch(fetchRequest)
      } catch {
        print("Failed to fetch movies: \(error)")
        return []
      }
    }
    
    func deleteMovie(_ movie: Movie) {
      persistentContainer.viewContext.delete(movie)

      do {
        try persistentContainer.viewContext.save()
      } catch {
        persistentContainer.viewContext.rollback()
        print("Failed to save context: \(error)")
      }
    }

    func updateMovie(_ movie: Movie) {
      do {
        try persistentContainer.viewContext.save()
      } catch {
        persistentContainer.viewContext.rollback()
        print("Failed to save context: \(error)")
      }
    }
}




