import Foundation
import CoreData

class GoalDao: Crud {
    
    static let current = GoalDao()
    private init(){
        
    }
    
    // MARK: - properties
    
    private let categoryDao = CategoryDao.current
    private let priorityDao = PriorityDao.current
    
    typealias Item = Goal
    
    var items: [Item]!
    
    // MARK: - methods
    
    func addOrUpdate(_ item: Item) {
        if !items.contains(item) {
            items.append(item)
        }
        save()
    }
    
    func getAll() -> [Item] {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        
        do {
            items = try context.fetch(fetchRequest)
        } catch {
            fatalError("Fetching Failed")
        }
        
        return items
    }
    
    func delete(_ item: Item) {
        context.delete(item)
        save()
    }
    
}
