//
//  ContentView.swift
//  HelloCoreData
//
//  Created by Jacek Kosiński G on 30/12/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    let storageProvider: StoragePrivider
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}


