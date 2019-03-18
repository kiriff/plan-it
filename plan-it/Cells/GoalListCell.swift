import UIKit

class GoalListCell: UITableViewCell {
    
    //MARK: - properties
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var viewPriority: UIView!
    @IBOutlet weak var buttonDesc: UIButton!
    
    //MARK: - methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
