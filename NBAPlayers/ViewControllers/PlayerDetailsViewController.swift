//
//  PlayerDetailsViewController.swift
//  NBAPlayers
//
//  Created by Варвара Уткина on 15.02.2024.
//

import UIKit

final class PlayerDetailsViewController: UIViewController {
    
    @IBOutlet var playerImage: UIImageView!
    
    var players: [Player]!
    var selectedPlayer: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedPlayer.fullName
        playerImage.image = UIImage(named: selectedPlayer.fullName) ?? UIImage.unknownPlayer
        print(selectedPlayer.team.fullName)
    }
}

// MARK: - TableViewDataSource
extension PlayerDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell = cell as? TeamCell else { return UITableViewCell() }
        cell.configure(with: selectedPlayer)
        return cell
    }
}
