//
//  EpisodeListRowView.swift
//  REDspace Code Challenge
//
//  Created by Akshay Grover on 2021-03-23.
//

import SwiftUI

struct EpisodesListRowView: View {
    let episode: Episode
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(episode.name)
                    .foregroundColor(.accentColor)
                Text(episode.episode)
                    .font(.footnote)
            }
            Spacer()
            Text(episode.airDate)
                .foregroundColor(.gray)
                .font(.footnote)
        }
    }
}
