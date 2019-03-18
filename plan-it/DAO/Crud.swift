import Foundation
import CoreData

protocol Crud {
    associatedtype Item: NSManagedObject
    
    var items: [Item]! { get set }
    
    func addOrUpdate(_ item: Item)
    
    func getAll() -> [Item]
    
    func delete(_ item: Item)
}
