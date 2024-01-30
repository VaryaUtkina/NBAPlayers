//
//  ViewController.swift
//  NBAPlayers
//
//  Created by Варвара Уткина on 30.01.2024.
//

import UIKit

final class MainViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPlayersInfo()
    }

    private func fetchPlayersInfo() {
        URLSession.shared.dataTask(
            with: URL(string: "https://www.balldontlie.io/api/v1/players")!
        ) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let playerInfo = try decoder.decode(PlayerInfo.self, from: data)
                print(playerInfo)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

