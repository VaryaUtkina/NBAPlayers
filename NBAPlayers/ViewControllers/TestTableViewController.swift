//
//  TestTableViewController.swift
//  NBAPlayers
//
//  Created by Варвара Уткина on 15.02.2024.
//

import UIKit

class TestTableViewController: UITableViewController {

    var player: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(player.fullName)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = player.team.fullName
        content.secondaryText = player.team.city
        cell.contentConfiguration = content
        return cell
    }

}
