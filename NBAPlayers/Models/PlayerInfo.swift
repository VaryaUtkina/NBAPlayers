//
//  PlayerInfo.swift
//  NBAPlayers
//
//  Created by Варвара Уткина on 30.01.2024.
//

import Foundation

struct Player: Decodable {
    let first_name: String
    let last_name: String
    let team: Team
}

struct Team: Decodable {
    let city: String
    let conference: String
    let full_name: String
}

struct PlayerInfo: Decodable {
    let data: [Player]
}
