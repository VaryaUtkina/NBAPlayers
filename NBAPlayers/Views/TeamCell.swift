//
//  TeamCell.swift
//  NBAPlayers
//
//  Created by Варвара Уткина on 15.02.2024.
//

import UIKit

final class TeamCell: UITableViewCell {
    @IBOutlet var teamImage: UIImageView!
    @IBOutlet var teamLabel: UILabel!
    
    func configure(with player: Player) {
//        teamImage.image = UIImage(named: player.team.fullName) ?? UIImage.basketball
        teamLabel.text = player.team.fullName
    }
    
}
