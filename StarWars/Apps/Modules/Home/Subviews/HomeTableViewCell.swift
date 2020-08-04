//
//  HomeTableViewCell.swift
//  StarWars
//
//  Created by Ari Munandar on 04/08/20.
//  Copyright © 2020 CoderLyn. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bindingData(category: Category) {
        iconImageView.image = category.icon
        titleLabel.text = category.title
    }
}
