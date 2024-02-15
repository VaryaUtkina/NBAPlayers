//
//  PlayerCell.swift
//  NBAPlayers
//
//  Created by Варвара Уткина on 15.02.2024.
//

import UIKit

final class PlayerCell: UITableViewCell {
    @IBOutlet var playerImage: UIImageView!
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var teamImage: UIImageView!
    @IBOutlet var teamNameLabel: UILabel!
    
    func configure(with player: Player) {
        fullNameLabel.text = player.fullName
        teamNameLabel.text = player.team.fullName
        
        playerImage.image = UIImage(named: player.fullName) ??
        UIImage.unknownPlayer
        teamImage.image = UIImage(named: player.team.fullName) ??
        UIImage.basketball
    }
}
