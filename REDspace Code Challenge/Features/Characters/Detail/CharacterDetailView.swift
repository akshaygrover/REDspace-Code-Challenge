//
//  CharacterDetailView.swift
//  REDspace Code Challenge
//
//  Created by Akshay Grover on 2021-03-22.
//

import SwiftUI
import Kingfisher

struct CharacterDetailView: View {
    
    let character: Character
    @StateObject private var data = EpisodesListViewModel()
    
    var body: some View {
        List {
            Section(header: Text("Detalis")) {
                HStack {
                    Spacer()
                    if let image = character.image,
                       let url = URL(string: image) {
                        KFImage(url)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .cornerRadius(25)
                    } else {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 150, height: 150)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
            }
            
            infoSectionView
            locationSectionView
            
            Section(header: Text("Episodes")) {
                ForEach(data.episodes, id: \.id) { episode in
                    NavigationLink(destination: EpisodeDetailView(episode: episode)) {
                        HStack {
                            Text(episode.name)
                            Spacer()
                            Text(episode.airDate)
                                .foregroundColor(.gray)
                                .font(.footnote)
                        }
                    }
                    if data.shouldDisplayNextPage {
                        nextPageView
                    }
                }
            }
            .redacted(reason: data.episodes.isEmpty ? .placeholder : [])
            
        }
        .listStyle(GroupedListStyle())
        .navigationTitle(character.name)
        .onAppear {
            data.fetchEpisodes()
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
    
    private var infoSectionView: some View {
        Section(header: Text("Info"),
                content: {
                    InfoRowView(label: "Species",
                                icon: "hare",
                                value: character.species)
                    InfoRowView(label: "Gender",
                                icon: "eyes",
                                value: character.gender)
                    InfoRowView(label: "Status",
                                icon: "waveform.path.ecg.rectangle",
                                value: character.status)
                })
    }
    
    private var locationSectionView: some View {
        Section(header: Text("Location")) {
            NavigationLink(
                destination:
                   EmptyView(),
                label: {
                    InfoRowView(label: "Location",
                                icon: "map",
                                value: character.location.name)
                })
            NavigationLink(
                destination:
                    EmptyView(),
                label: {
                    InfoRowView(label: "Origin",
                                icon: "paperplane",
                                value: character.origin.name)
                })
        }
    }

}

struct InfoRowView: View {
    let label: String
    let icon: String
    let value: String
    
    var body: some View {
        HStack {
            Label(label, systemImage: icon)
            Spacer()
            Text(value)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
        }
    }
}
//
//struct CharacterDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterDetailView()
//    }
//}
