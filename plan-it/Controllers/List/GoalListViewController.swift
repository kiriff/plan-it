import UIKit
import CoreData

class GoalListViewController: UITableViewController {

    //MARK: - Properties
    
    var goalList: [Goal]!
    let goalDao = GoalDao.current
    let categotyDao = CategoryDao.current
    let priorityDao = PriorityDao.current
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

    // MARK: - Methods
    
    private func initialSetup() {
        //        self.clearsSelectionOnViewWillAppear = false
        //        self.navigationItem.rightBarButtonItem = self.editButtonItem
        //        self.tableView.tableFooterView = UIView()
        
        self.title = "Цели"
        goalList = goalDao.getAll()
        
    }
    
    // MARK: - IBActions
    
    @IBAction func initDBButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func clearDBButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? GoalListCell else {
            fatalError("Goal cell type error")
        }
        
        let goal = goalList[indexPath.row]
        
        cell.labelName.text = goal.name
        cell.labelCategory.text = goal.category?.name
        
        if let priority = goal.priority {
            switch priority.index {
            case 1: cell.viewPriority.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            case 2: cell.viewPriority.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            case 3: cell.viewPriority.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            default: cell.viewPriority.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            }
        }
        
        cell.buttonDesc.isHidden = goal.desc == nil || goal.desc?.isEmpty ?? true
        
        if let difference = goal.daysLeft() {
            switch difference {
            case 0: cell.labelDate.text = "Сегодня"
            case 1: cell.labelDate.text = "Завтра"
            case 0...: cell.labelDate.text = "\(difference) дн."
            case ..<0: cell.labelDate.text = "\(difference) дн."; cell.labelDate.textColor = #colorLiteral(red: 0.7595406975, green: 0, blue: 0.2313725501, alpha: 1)
            default: cell.labelDate.text = ""
            }
        } else {
            cell.labelDate.text = ""
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            goalDao.delete(goalList[indexPath.row])
            goalList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "UpdateGoal":
            let cell = sender as! GoalListCell
            guard let controller = segue.destination as? GoalDetailsController else {
                fatalError("prepare error")
            }
            
            let selectedIndex = (tableView.indexPath(for: cell)?.row)!
            let selectedGoal = goalDao.items[selectedIndex]
            controller.goal = selectedGoal
            controller.title = "Редактирование"
        default:
            return
        }
    }

}
