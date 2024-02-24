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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let playerVC = segue.destination as? PlayerDetailsViewController else { return }
        playerVC.selectedPlayer = sender as? Player
        playerVC.players = players
    }
    
    private func fetchPlayers() {
        Task {
            do {
                players = try await networkManager.fetchPlayers().data
                tableView.reloadData()
            } catch {
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

// MARK: - TableViewDelegate
extension PlayersViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let player = players[indexPath.row]
        performSegue(withIdentifier: "showPlayer", sender: player)
    }
}
