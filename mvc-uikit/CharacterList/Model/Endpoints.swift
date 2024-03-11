//
//  Endpoints.swift
//  mvc-uikit
//
//  Created by Harlock on 10/03/2024.
//
import Foundation

enum Endpoints {
    private var baseURL: String { return "https://rickandmortyapi.com/api" }

    case character
    case charactersPage(Int)
    case locations
    case episodes
    
    private var fullPath: String {
        var endpoint:String
        switch self {
        case .character:
            endpoint = "/character"
        case .charactersPage(let id):
            endpoint = "/character/?page=\(id)"
        case .locations:
            endpoint = "/locations"
        case .episodes:
            endpoint = "/episodes"
        }
        return baseURL + endpoint
    }
    
    var url: URL {
        guard let url = URL(string: fullPath) else {
            preconditionFailure("The url used in \(Endpoints.self) is not valid")
        }
        return url
    }
}
