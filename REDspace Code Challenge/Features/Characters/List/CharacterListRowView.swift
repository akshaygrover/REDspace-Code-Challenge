//
//  CharacterListRowView.swift
//  REDspace Code Challenge
//
//  Created by Akshay Grover on 2021-03-22.
//

import SwiftUI
import Kingfisher

struct CharacterListRowView: View {
    
    let character: Character
    
    var body: some View {
        HStack {
            if let image = character.image,
               let url = URL(string: image) {
                KFImage(url)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)
            }
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.title3)
                    .foregroundColor(.accentColor)
                    .redacted(reason: character.name.isEmpty ? .placeholder : [])
                    //.redacted(reason: character.name == nil ? .placeholder : [])
                Text("\(character.episode.count) episode(s)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .redacted(reason: character.episode.isEmpty ? .placeholder : [])
            }
        }
    }
}

//struct CharacterListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterListRowView()
//    }
//}
