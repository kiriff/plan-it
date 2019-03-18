import Foundation
import CoreData

class PriorityDao: Crud {
    
    static let current = PriorityDao()
    private init(){}
    
    // MARK: - properties
    
    typealias Item = Priority
    
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
