//
//  ContentView.swift
//  REDspace Code Challenge
//
//  Created by Akshay Grover on 2021-03-22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var data = CharacterListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.characters, id: \.id) {  character in
                    VStack {
                        Text(character.name).padding()
                    }
                }
            }
            .navigationTitle("Characters")
            .onAppear(perform: data.fetchCharacters)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
