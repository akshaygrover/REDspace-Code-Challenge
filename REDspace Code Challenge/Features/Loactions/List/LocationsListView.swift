//
//  LocationsListView.swift
//  REDspace Code Challenge
//
//  Created by Akshay Grover on 2021-03-23.
//

import SwiftUI

struct LocationsListView: View {
    @StateObject private var data = LocationsListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.locations, id: \.id) { location in
                    NavigationLink(
                        destination: LocationDetailView(location: location),
                        label: {
                            LocationsListRowView(location: location)
                        })
                }
                if data.shouldDisplayNextPage {
                    nextPageView
                }
            }
            .navigationTitle("Locations")
            .onAppear {
                data.fetchLocations()
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

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
    }
}
