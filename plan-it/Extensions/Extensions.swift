import Foundation

extension Date {
    
    var today: Date {
        return rewindDays(0)
    }
    
    func rewindDays(_ days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: self)!
    }
    
    func offsetFrom(date: Date) -> Int {
        let calendar = Calendar.current
        let startOfCurrentDate = calendar.startOfDay(for: date)
        let startofOtherDay = calendar.startOfDay(for: self)
        
        return calendar.dateComponents([.day], from: startOfCurrentDate, to: startofOtherDay).day!
    }
    
    var formatted: String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.locale = Locale(identifier: "ru_RU")
        dateFormatterPrint.dateFormat = "E, d MMM yyyy HH:mm:ss"
        
        return dateFormatterPrint.string(from: self)
    }
    
}

extension Goal {
    
    func daysLeft() -> Int! {
        return self.deadline?.offsetFrom(date: Date().today)
    }
    
}
