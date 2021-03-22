//
//  Character.swift
//  REDspace Code Challenge
//
//  Created by Akshay Grover on 2021-03-22.
//

import Foundation

struct CharacterResponse: Decodable {
    let info: Info
    let results: [Character]
}

struct CharacterLocation: Decodable {
    let name: String
    let url: String
}

struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
