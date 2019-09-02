//
//  GameCell.swift
//  GameList
//
//  Created by Bernardo Silva on 30/08/19.
//  Copyright © 2019 Bernardo. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {

    @IBOutlet weak var timeSpentLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var gameViewModel: GameViewModel? = nil {
        didSet {
            guard let viewModel = gameViewModel else { return }
            viewModel.genreLabel.bind { (genre) in
                self.genreLabel.text = genre
            }
            viewModel.nameLabel.bind { (name) in
                self.nameLabel.text = name
            }
            viewModel.timeSpentLabel.bind { (timeSpent) in
                self.timeSpentLabel.text = timeSpent
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
