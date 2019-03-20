import Foundation
import CoreData

class CategoryDao: Crud {
    
    static let current = CategoryDao()
    private init(){
        items = getAll()
    }
    
    // MARK: - properties
    
    typealias Item = Category
    
    var items: [Category]!
    
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
