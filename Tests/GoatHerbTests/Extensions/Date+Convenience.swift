import Foundation

extension Date {
    init?(year: Int, month: Int, day: Int, hour: Int? = nil, minute: Int? = nil, second: Int? = nil, timeZone: TimeZone? = nil, calendar: Calendar? = nil) {
        let dateComponents = DateComponents(
            calendar: calendar ?? .current,
            timeZone: timeZone ?? .current,
            year: year,
            month: month,
            day: day,
            hour: hour,
            minute: minute,
            second: second
        )
        
        guard let date = dateComponents.date else {
            return nil
        }
        
        self = date
    }
    
    // Shorthand for TimeZone that takes a String as the identifier.
    init?(year: Int, month: Int, day: Int, hour: Int? = nil, minute: Int? = nil, second: Int? = nil, timeZone: String, calendar: Calendar? = nil) {
        self.init(year: year, month: month, day: day, hour: hour, minute: minute, second: second, timeZone: .init(identifier: timeZone), calendar: calendar)
    }
}
