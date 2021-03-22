//
//  NetworkManager.swift
//  REDspace Code Challenge
//
//  Created by Akshay Grover on 2021-03-22.
//

import Foundation
import Moya

struct NetworkManager: Networkable {

    static let shared = NetworkManager()
    var provider = MoyaProvider<RickAndMortyAPI>()

    func getCharacter(name: String,
                      page: Int,
                      completion: @escaping ([Character], Info) -> Void) {

        provider.request(.character(name: name, page: page), completion: { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(CharacterResponse.self, from: response.data)
                    completion(results.results, results.info)
                }
                catch let error {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        })
    }

    func getCharactersWith(ids: String, completion: @escaping ([Character]) -> Void) {
        provider.request(.charactersWith(ids: ids), completion: { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode([Character].self, from: response.data)
                    completion(results)
                }
                catch let error {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        })
    }

    func getLocation(name: String,
                     page: Int,
                     completion: @escaping ([Location], Info) -> Void) {

        provider.request(.location(name: name, page: page), completion: { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(LocationResponse.self, from: response.data)
                    completion(results.results, results.info)
                }
                catch let error {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        })

    }

    func getEpisode(name: String,
                    page: Int,
                    completion: @escaping ([Episode], Info) -> Void) {

        provider.request(.episode(name: name, page: page), completion: { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(EpisodeResponse.self, from: response.data)
                    completion(results.results, results.info)
                }
                catch let error {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        })

    }
}
