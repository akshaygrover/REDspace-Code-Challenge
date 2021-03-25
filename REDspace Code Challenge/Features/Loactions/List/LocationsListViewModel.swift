//
//  LocationsListViewModel.swift
//  REDspace Code Challenge
//
//  Created by Akshay Grover on 2021-03-23.
//

import SwiftUI

class LocationsListViewModel: ObservableObject {
    @Published var locations = [Location]()
    
    let manager: NetworkManager
    
    init(manager: NetworkManager = .shared) {
        self.manager = manager
    }
    
    
    public private(set) var totalPage: Int?
    public private(set) var totalCharacters: Int?
    
    public var currentPage = 1 {
        didSet {
            fetchLocations()
        }
    }
    
    public var shouldDisplayNextPage: Bool {
        if locations.isEmpty == false,
           let totalPages = totalPage,
           currentPage < totalPages {
            return true
        }
        return false
    }
    
    func fetchLocations(name: String = "") {
        manager.getLocation(name: name, page: currentPage) { [weak self] locations, info in
            self?.locations.append(contentsOf: locations)
            self?.totalPage = info.pages
            self?.totalCharacters = info.count
        }
    }
    
}
