//
//  StorageProvider.swift
//  HelloCoreData
//
//  Created by Jacek Kosiński G on 30/12/2022.
//

import Foundation
import CoreData

class StoragePrivider {
    let persistentContainer: NSPersistentContainer
    init() {
        persistentContainer = NSPersistentContainer(name: "HelloCoreData")
        
        persistentContainer.loadPersistentStores(completionHandler: {
            description, error in
            if let error = error {
                fatalError("Cos sie spierdolilo w Core Data \(error)")
            }
        })
    }
}
