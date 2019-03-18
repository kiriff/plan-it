import Foundation
import CoreData
import UIKit

class Db {
    var context: NSManagedObjectContext!
    
    init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("AppDelegare error")
        }
        
        context = appDelegate.persistentContainer.viewContext
    }
    
    func initData() {
        let cat1 = addCategory(name: "Спорт")
        let cat2 = addCategory(name: "Семья")
        let cat3 = addCategory(name: "Отдых")
        let cat4 = addCategory(name: "Бизнес")
        let cat5 = addCategory(name: "Здоровье")
        let cat6 = addCategory(name: "Личное")
        
        let priority1 = addPriority(name: "Низкий", index:1)
        let priority2 = addPriority(name: "Нормальный", index:2)
        let priority3 = addPriority(name: "Высокий", index:3)
        
        
        let task1 = addGoal(name: "Сходить в бассейн", completed: false, deadline: Date().rewindDays(15), desc: "доп. инфо", category: cat1, priority: priority1)
        let task2 = addGoal(name: "Выезд на природу", completed: false, deadline: Date().rewindDays(-10), desc: "", category: cat3, priority: priority3)
        let task3 = addGoal(name: "Вынести мусор", completed: false, deadline: Date().rewindDays(25), desc: "", category: cat6, priority: priority3)
        let task4 = addGoal(name: "Купить продукты", completed: false, deadline: Date().rewindDays(1), desc: "доп. инфо", category: cat2, priority: priority1)
        let task5 = addGoal(name: "Помыть машину", completed: false, deadline: Date().today, desc: "", category: cat2, priority: priority1)
        
        let task6 = addGoal(name: "Сделать ремонт", completed: false, deadline: Date().rewindDays(10), desc: "", category: cat1, priority: priority1)
        
        let task7 = addGoal(name: "Отвезти в садик", completed: false, deadline: Date().today, desc: "", category: cat3, priority: priority3)
        
        let task8 = addGoal(name: "Футбольный матч", completed: false, deadline: Date().today, desc: "", category: cat5, priority: priority2)
        
        let task9 = addGoal(name: "Купить подарки", completed: false, deadline: Date().today, desc: "", category: cat4, priority: priority1)
        
        let task10 = addGoal(name: "Помыть машину", completed: false, deadline: Date().today, desc: "", category: cat6, priority: priority2)
    }
    
    func resetDB() {
        var list: [NSManagedObject] = []
        list.append(contentsOf: getAllGoals())
        list.append(contentsOf: getAllCategories())
        list.append(contentsOf: getAllPriorities())
        
        list.forEach { (item) in
            context.delete(item)
        }
        
        list = []
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
    }
    
    func deleteGoal(goal: Goal) {
        context.delete(goal)
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
    }
    
    func getAllCategories() -> [Category] {
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        
        let list: [Category]
        
        do {
            list = try context.fetch(fetchRequest)
        } catch {
            fatalError("Fetching failed")
        }
        
        return list
    }
    
    func getAllPriorities() -> [Priority] {
        let fetchRequest: NSFetchRequest<Priority> = Priority.fetchRequest()
        
        let list: [Priority]
        
        do {
            list = try context.fetch(fetchRequest)
        } catch {
            fatalError("Fetching failed")
        }
        
        return list
    }
    
    func getAllGoals() -> [Goal] {
        let fetchRequest: NSFetchRequest<Goal> = Goal.fetchRequest()
        
        let list: [Goal]
        
        do {
            list = try context.fetch(fetchRequest)
        } catch {
            fatalError("Fetching failed")
        }
        
        return list
    }
    
    func addCategory(name: String) -> Category {
        let category = Category(context: context)
        
        category.name = name
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
        
        return category
    }
    
    func addGoal(name: String, completed: Bool, deadline: Date?, desc: String?, category: Category?, priority: Priority?) -> Goal {
        let goal = Goal(context: context)
        
        goal.name = name
        goal.completed = completed
        goal.deadline = deadline
        goal.desc = desc
        goal.category = category
        goal.priority = priority
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
        
        return goal
    }
    
    func addPriority(name: String, index: Int32) -> Priority {
        let priority = Priority(context: context)
        
        priority.name = name
        priority.index = index
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
        
        return priority
    }
}
