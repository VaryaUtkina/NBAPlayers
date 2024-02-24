//
//  NetworkManager.swift
//  NBAPlayers
//
//  Created by Варвара Уткина on 15.02.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchPlayers() async throws -> PlayerInfo {
        guard let url = URL(string: "https://www.balldontlie.io/api/v1/players") else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            return try decoder.decode(PlayerInfo.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}
