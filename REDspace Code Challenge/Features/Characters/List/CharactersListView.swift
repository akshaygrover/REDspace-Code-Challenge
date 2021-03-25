//
//  ContentView.swift
//  REDspace Code Challenge
//
//  Created by Akshay Grover on 2021-03-22.
//

import SwiftUI

struct CharactersListView: View {
    
    @StateObject private var data = CharactersListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.characters, id: \.id) { character in
                    NavigationLink(
                        destination: CharacterDetailView(character: character),
                        label: {
                            CharacterListRowView(character: character)
                        })
                }
                if data.shouldDisplayNextPage {
                    nextPageView
                }
            }
            .navigationTitle("Characters")
            .onAppear {
                data.fetchCharacters()
            }
        }
    }
    
    private var nextPageView: some View {
        HStack {
            Spacer()
            VStack {
                ProgressView()
                Text("Loading next page...")
            }
            Spacer()
        }
        .onAppear(perform: {
            data.currentPage += 1
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView()
    }
}
