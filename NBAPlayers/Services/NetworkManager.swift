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
    
    func fetchPlayers(from urlString: String, completion: @escaping(Result<[Player], NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: urlString)!) { data, _, error in
            guard let data else {
                print(error ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let players = try decoder.decode(PlayerInfo.self, from: data).data
                completion(.success(players))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
