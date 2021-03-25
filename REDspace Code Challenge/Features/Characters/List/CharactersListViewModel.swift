//
//  CharacterListViewModel.swift
//  REDspace Code Challenge
//
//  Created by Akshay Grover on 2021-03-22.
//

import Foundation
import SwiftUI

class CharactersListViewModel: ObservableObject {
    @Published var characters: [Character] = [Character]()
    
    let manager: NetworkManager
    
    init(manager: NetworkManager = .shared) {
        self.manager = manager
    }

     private(set) var totalPage: Int?
     private(set) var totalCharacters: Int?
    
    var currentPage: Int = 1 {
        didSet {
            fetchCharacters()
        }
    }
    
     var shouldDisplayNextPage: Bool {
        if characters.isEmpty == false,
           let totalPages = totalPage,
           currentPage < totalPages {
            return true
        }
        return false
    }
    
    func fetchCharacters() {
        manager.getCharacter(name: "", page: currentPage) { [weak self] characters, info in
            self?.characters.append(contentsOf: characters)
            self?.totalPage = info.pages
            self?.totalCharacters = info.count
            
        }
    }
    
    
}
