//
//  GoalDateCell.swift
//  plan-it
//
//  Created by Kirill Philipov on 3/19/19.
//  Copyright © 2019 Kirill Philipov. All rights reserved.
//

import UIKit

class GoalDateCell: UITableViewCell {

    @IBOutlet weak var labelDeadline: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
