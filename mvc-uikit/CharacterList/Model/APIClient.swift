//
//  ListOfCharactersAPIClient.swift
//  mvc-uikit
//
//  Created by Harlock on 07/03/2024.
//

import Foundation

class APIClient {
    
    func getListOfCharacters() async -> CharacterModelResponse {
        let url = Endpoints.character.url
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(CharacterModelResponse.self, from: data)
    }
}
