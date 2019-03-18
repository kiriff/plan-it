import Foundation
import CoreData
import UIKit

extension Crud {
    var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func save() {
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
}
