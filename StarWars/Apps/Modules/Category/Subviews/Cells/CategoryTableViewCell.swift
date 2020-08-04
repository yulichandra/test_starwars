//
//  CategoryTableViewCell.swift
//  StarWars
//
//  Created by Ari Munandar on 04/08/20.
//  Copyright © 2020 CoderLyn. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindingData(data: (String, String)) {
        titleLabel.text = data.0
        subtitleLabel.text = data.1
    }
}
