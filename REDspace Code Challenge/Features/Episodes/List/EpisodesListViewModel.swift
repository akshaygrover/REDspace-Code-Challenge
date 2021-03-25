//
//  EpisodeListViewModel.swift
//  REDspace Code Challenge
//
//  Created by Akshay Grover on 2021-03-22.
//

import SwiftUI

class EpisodesListViewModel: ObservableObject {
    @Published var episodes: [Episode] = [Episode]()
    @Published var charactersInEpisode: [Character] = [Character]()
    
    let manager: NetworkManager
    
    init(manager: NetworkManager = .shared) {
        self.manager = manager
    }
    
     private(set) var totalPage: Int?
     private(set) var totalCharacters: Int?
    
     var currentPage = 1 {
        didSet {
            fetchEpisodes()
        }
    }
    
     var shouldDisplayNextPage: Bool {
        if episodes.isEmpty == false,
           let totalPages = totalPage,
           currentPage < totalPages {
            return true
        }
        return false
    }
    
    func fetchEpisodes(name: String = "") {
        manager.getEpisode(name: name, page: currentPage) { [weak self] episodes, info in
            self?.episodes.append(contentsOf: episodes)
            self?.totalPage = info.pages
            self?.totalCharacters = info.count
        }
    }
    
    func fetchCharactersOf(episode: Episode) {
        let characterIds = episode.characterIds()
        manager.getCharactersWith(ids: characterIds) { [weak self] characters in
            self?.charactersInEpisode.append(contentsOf: characters)
        }
    }
}
