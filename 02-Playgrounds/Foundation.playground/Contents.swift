import Foundation

func howLongUntilHalloween() -> String {
    let calendar = Calendar.current
    let timeZone = TimeZone.current
    
    let now = Date()
    
    let yearOfNextHalloween = calendar.component(.year, from: now)
    
    var components = DateComponents(calendar: calendar, timeZone: timeZone, year: yearOfNextHalloween, month: 10, day: 31, hour:0, minute: 0, second: 0)
    
    guard var halloween = components.date else {
        print("할로윈 날짜를 가져올 수 없습니다.")
        return ""
    }
    
    if halloween < now {
        components.year = yearOfNextHalloween + 1
        halloween = components.date!
    }
    
    let componentFormatter = DateComponentsFormatter()
    componentFormatter.unitsStyle = .full
    componentFormatter.allowedUnits = [.month, .day, .hour, .minute , .second]
    
    return componentFormatter.string(from: now, to: halloween)!
    
    
}

let timeUntiHalloween = howLongUntilHalloween()
print("할로윈 까지 \(timeUntiHalloween) 남았습니다.")
