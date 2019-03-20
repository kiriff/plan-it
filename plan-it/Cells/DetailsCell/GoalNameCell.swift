//
//  GoalNameCell.swift
//  plan-it
//
//  Created by Kirill Philipov on 3/19/19.
//  Copyright © 2019 Kirill Philipov. All rights reserved.
//

import UIKit

class GoalNameCell: UITableViewCell {

    @IBOutlet weak var textFieldName: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension GoalNameCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
