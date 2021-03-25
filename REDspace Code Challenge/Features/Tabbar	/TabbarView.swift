//
//  TabbarView.swift
//  REDspace Code Challenge
//
//  Created by Akshay Grover on 2021-03-22.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView {
            CharactersListView()
                .tabItem {
                    Label("Characters", systemImage: "person.crop.square.fill.and.at.rectangle")
                }
            EpisodesListView()
                .tabItem {
                    Label("Episodes", systemImage: "tv")
                }
            LocationsListView()
                    .tabItem {
                        Label("Locations", systemImage: "map")
                    }
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
