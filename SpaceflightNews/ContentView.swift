//
//  ContentView.swift
//  SpaceflightNews
//
//  Created by artembolotov on 18.12.2022.
//

import SwiftUI
import NewsNetwork

struct ContentView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text("\(modelData.articles.count)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
