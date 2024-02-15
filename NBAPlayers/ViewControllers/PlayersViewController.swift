//
//  ViewController.swift
//  NBAPlayers
//
//  Created by Варвара Уткина on 30.01.2024.
//

import UIKit

final class PlayersViewController: UITableViewController {
    
    private let networkManager = NetworkManager.shared
    
    private var players: [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 104
        fetchPlayers()
    }
    
    private func fetchPlayers() {
        networkManager.fetchPlayers(from: "https://www.balldontlie.io/api/v1/players") { result in
            switch result {
            case .success(let players):
                self.players = players
                DispatchQueue.main.async { [unowned self] in
                    tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - TableViewDataSource
extension PlayersViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)
        guard let cell = cell as? PlayerCell else { return UITableViewCell() }
        let player = players[indexPath.row]
        cell.configure(with: player)
        return cell
    }
}
