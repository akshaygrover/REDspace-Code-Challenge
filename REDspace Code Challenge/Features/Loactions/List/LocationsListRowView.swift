//
//  LocationsListRowView.swift
//  REDspace Code Challenge
//
//  Created by Akshay Grover on 2021-03-23.
//

import SwiftUI

struct LocationsListRowView: View {
    let location: Location
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(location.name)
                    .foregroundColor(.accentColor)
                Text("\(location.residents?.count ?? 0) resident(s)")
                    .font(.footnote)
            }
            Spacer()
            Text(location.dimension ?? "")
                .foregroundColor(.gray)
                .font(.footnote)
        }
    }
}
