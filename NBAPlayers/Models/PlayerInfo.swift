//
//  PlayerInfo.swift
//  NBAPlayers
//
//  Created by Варвара Уткина on 30.01.2024.
//

import Foundation

struct PlayerInfo: Decodable {
    let data: [Player]
}

struct Player: Decodable {
    let firstName: String
    let lastName: String
    let team: Team
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

struct Team: Decodable {
    let city: String
    let conference: String
    let fullName: String
}
