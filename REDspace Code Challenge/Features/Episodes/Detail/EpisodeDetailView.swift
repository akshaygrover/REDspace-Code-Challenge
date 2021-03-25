//
//  EpisodeDetailView.swift
//  REDspace Code Challenge
//
//  Created by Akshay Grover on 2021-03-22.
//

import SwiftUI
import Kingfisher

struct EpisodeDetailView: View {
    
    @StateObject private var data = EpisodesListViewModel()
    let episode: Episode
    
    var body: some View {
        List {
            Section(header: Text("Info")) {
                InfoRowView(label: "Name",
                            icon: "info",
                            value: episode.name)
                InfoRowView(label: "Air date",
                            icon: "calendar",
                            value: episode.airDate)
                InfoRowView(label: "Code",
                            icon: "barcode",
                            value: episode.episode)
            }
                Section(header: Text("Characters")) {
                    ForEach(data.charactersInEpisode, id: \.id) { character in
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
                        if data.shouldDisplayNextPage {
                            nextPageView
                        }
                    }
                }
                .redacted(reason: data.charactersInEpisode.isEmpty ? .placeholder : [])
        }
        .listStyle(GroupedListStyle())
        .onAppear {
            data.fetchCharactersOf(episode: episode)
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

//struct EpisodeDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeDetailView()
//    }
//}
