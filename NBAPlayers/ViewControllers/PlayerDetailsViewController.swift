//
//  PlayerDetailsViewController.swift
//  NBAPlayers
//
//  Created by Варвара Уткина on 15.02.2024.
//

import UIKit

final class PlayerDetailsViewController: UIViewController {
    
    @IBOutlet var playerImage: UIImageView!
    @IBOutlet var teamImage: UIImageView!
    @IBOutlet var teamLabel: UILabel!
    
    var players: [Player]!
    var selectedPlayer: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedPlayer.fullName
        playerImage.image = UIImage(named: selectedPlayer.fullName) ?? UIImage.unknownPlayer
        teamImage.image = UIImage(named: selectedPlayer.team.fullName) ?? UIImage.basketball
        teamLabel.text = selectedPlayer.team.fullName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let teamVC = segue.destination as? TeamViewController else { return }
        teamVC.players = players
        teamVC.selectedPlayer = selectedPlayer
    }
}

