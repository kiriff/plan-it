import UIKit

class GoalDetailsController: UIViewController {
    
    // MARK: - properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var goal: Goal!
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - methods

}

// MARK: - extensions

extension GoalDetailsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) 
        
        cell.textLabel?.text = goal.name
        
        return cell
    }
    
}
