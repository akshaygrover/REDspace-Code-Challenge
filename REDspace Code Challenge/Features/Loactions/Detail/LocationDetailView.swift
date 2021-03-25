//
//  LocationDetailView.swift
//  REDspace Code Challenge
//
//  Created by Akshay Grover on 2021-03-23.
//

import SwiftUI
import Kingfisher
struct LocationDetailView: View {
    
    let location: Location
    @StateObject private var data = CharactersListViewModel()
    
    var body: some View {
        List {
            Section(header: Text("Info")) {
                InfoRowView(label: "Name",
                            icon: "info",
                            value: location.name)
                InfoRowView(label: "Dimension",
                            icon: "tornado",
                            value: location.dimension ?? "")
                InfoRowView(label: "Type",
                            icon: "newspaper",
                            value: location.type ?? "")
            }
            
            
            
            
            if let residents = data.characters.filter({ location.residents?.contains($0.url) == true }) {
                Section(header: Text("Residents")) {
                    ForEach(residents, id: \.id) { character in
                        NavigationLink(
                            destination: CharacterDetailView(character: character),
                            label: {
                                HStack {
                                    if let image = character.image,
                                       let url = URL(string: image) {
                                        KFImage(url)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 28, height: 28)
                                            .cornerRadius(14)
                                    }
                                    Text(character.name)
                                }
                            })
                    }
                }
                .redacted(reason: data.characters.isEmpty ? .placeholder : [])
                
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle(location.name)
        .onAppear {
            data.fetchCharacters()
        }
    }
}

//struct LocationDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationDetailView()
//    }
//}
