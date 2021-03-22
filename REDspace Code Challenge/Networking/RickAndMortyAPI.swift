//
//  RickAndMortyAPI.swift
//  REDspace Code Challenge
//
//  Created by Akshay Grover on 2021-03-22.
//

import Foundation
import Moya

enum RickAndMortyAPI {
    case character(name: String, page: Int)
    case charactersWith(ids: String)
    case location(name: String, page: Int)
    case episode(name: String, page: Int)
}

extension RickAndMortyAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://rickandmortyapi.com/api") else {
            fatalError("Base URL could not be configured")
        }
        return url
    }
    var path: String {
        switch self {
        case .character:
            return "/character"
        case .charactersWith(let ids):
            return "/character/\(ids)"
        case .location:
            return "/location"
        case .episode:
            return "/episode"
        }
    }
    var method: Moya.Method {
        return .get
    }
    var sampleData: Data {
        return Data()
    }
    var task: Task {
        switch self {
        case .character(let name, let page):
            return .requestParameters(
                    parameters: [
                        "name": name,
                        "page": page
                    ],
                    encoding: URLEncoding.queryString)

        case .charactersWith(_):
            return .requestParameters(
                    parameters: [:],
                    encoding: URLEncoding.queryString)

        case .location(let name, let page):
            return .requestParameters(
                    parameters: [
                        "name": name,
                        "page": page,
                    ],
                    encoding: URLEncoding.queryString)

        case .episode(let name, let page):
            return .requestParameters(
                    parameters: [
                        "name": name,
                        "page": page
                    ],
                    encoding: URLEncoding.queryString)
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    var validationType: ValidationType {
        return .successCodes
    }

}

