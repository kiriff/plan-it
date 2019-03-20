import UIKit
import SPStorkController

class GoalDetailsController: UIViewController {
    
    // MARK: - properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var goal: Goal!
    
    var delegate: ActionViewControllerDelegate!
    
    var goalName: String!
    var goalCategory: Category!
    var goalPriority: Priority!
    var goalDate: Date!
    var goalDesc: String!
    
    var textFieldName: UITextField!
    var textViewDesc: UITextView!
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if goal != nil {
            goalName = goal.name
            goalCategory = goal.category
            goalPriority = goal.priority
            goalDate = goal.deadline
            goalDesc = goal.desc
        }
    }

    // MARK: - methods
    
    // MARK: - IBActions
    
    @IBAction func tapCancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapSave(_ sender: UIBarButtonItem) {
        goal.name = textFieldName.text
        goal.desc = textViewDesc.text
        delegate.done(sourse: self, data: goal)
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == nil { return }
        switch segue.identifier! {
        case "SelectCategory":
            if let controller = segue.destination as? CategoryListController {
                controller.selectedCategory = goalCategory
            }
        case "SelectPriority":
            if let controller = segue.destination as? PriorityListViewController {
                controller.selectedPriority = goalPriority
            }
        default:
            return
        }
    }
    
}

// MARK: - extensions

extension GoalDetailsController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Название"
        case 1: return "Категория"
        case 2: return "Приоритет"
        case 3: return "Дата"
        case 4: return "Описание"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellGoalName", for: indexPath) as! GoalNameCell
            
            cell.textFieldName.text = goal.name ?? "Не выбрано"
            textFieldName = cell.textFieldName
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellGoalCategory", for: indexPath) as! GoalCategoryCell
            
            cell.labelCategory.text = goal.category?.name ?? "Не выбрано"
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellGoalPriority", for: indexPath) as! GoalPriorityCell
            
            cell.labelPriority.text = goal.priority?.name ?? "Не выбрано"
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellGoalDeadline", for: indexPath) as! GoalDateCell
            
            cell.labelDeadline.text = goal.deadline?.formatted ?? "Не выбрано"
            
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellGoalDesc", for: indexPath) as! GoalDescCell
            
            cell.textViewDesc.text = goal.desc ?? "Не выбрано"
            textViewDesc = cell.textViewDesc
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 44
        case 1: return 44
        case 2: return 44
        case 3: return 44
        case 4: return 120
        default:
            return 44
        }
    }
}
