//
//  Location.swift
//  REDspace Code Challenge
//
//  Created by Akshay Grover on 2021-03-22.
//

import Foundation

struct LocationResponse: Decodable {
    let info: Info
    let results: [Location]
}

struct Location: Decodable {
    let id: Int?
    let name: String
    let type: String?
    let dimension: String?
    let residents: [String]?
    let url: String
    let created: String?
}
