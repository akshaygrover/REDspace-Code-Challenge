//
//  Networkable.swift
//  REDspace Code Challenge
//
//  Created by Akshay Grover on 2021-03-22.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<RickAndMortyAPI> { get }
    func getCharacter(name: String,
                      page: Int,
                      completion: @escaping ([Character], Info) -> Void)
    func getCharactersWith(ids: String,
                           completion: @escaping ([Character]) -> Void)
    func getLocation(name: String,
                     page: Int,
                     completion: @escaping ([Location], Info) -> Void)
    func getEpisode(name: String,
                    page: Int,
                    completion: @escaping ([Episode], Info) -> Void)
}
