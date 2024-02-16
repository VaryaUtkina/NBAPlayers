//
//  TeamViewController.swift
//  NBAPlayers
//
//  Created by Варвара Уткина on 16.02.2024.
//

import UIKit

final class TeamViewController: UIViewController {
    @IBOutlet var teamImage: UIImageView!
    @IBOutlet var conferenceLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    
    var players: [Player]!
    var selectedPlayer: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedPlayer.team.fullName
        teamImage.image = UIImage(named: selectedPlayer.team.fullName)
        cityLabel.text = "City: \(selectedPlayer.team.city)"
        conferenceLabel.text = "Conference: \(selectedPlayer.team.conference)"
    }

}
