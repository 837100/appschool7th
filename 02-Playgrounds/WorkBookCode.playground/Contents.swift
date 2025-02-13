import Foundation


//func fullName(givenName: String,
//              middleName: String,
//              familyName: String) -> String{
//    return "\(givenName) \(middleName) \(familyName)"
//}


//
//class Person {
//    let givenName: String
//    let middleName: String
//    let familyName: String
//    var countryOfResidence: String = "UK"
//
//
//    init(givenName: String, middleName: String, familyName: String) {
//        self.givenName = givenName
//        self.middleName = middleName
//        self.familyName = familyName
//    }
//
//
//
//
//
//
//    var displayString: String {
//        return "\(self.fullName()) - Location:\(self.countryOfResidence)"
//    }
//
//    func fullName() -> String {
//        return "\(givenName) \(middleName) \(familyName)"
//    }
//}


struct PersonName {
    let givenName: String
    let middleName: String
    var familyName: String
    
    func fullName() -> String {
        return "\(givenName) \(middleName) \(familyName)"
    }
    
    mutating func change(familyName: String) {
        self.familyName = familyName
    }
}

class Person {
    let birthName: PersonName
    var currentName: PersonName
    var countryOfResidence: String
    init(name: PersonName, countryOfResidence: String = "UK") {
        birthName = name
        currentName = name
        self.countryOfResidence = countryOfResidence
    }
        var displayString: String {
            return "\(currentName.fullName()) - Location: \(countryOfResidence)"
      
    }
}

final class Friend: Person{
    var whereWeMet: String?
    
    override var displayString: String {
        let meetingPlace = whereWeMet ?? "Don't know where we met"
        return "\(super.displayString) - \(meetingPlace)"
    }
    
}

//
//final class Family: Person{
//    let relationship: String
//    
//    init(givenName: String, middleName: String, familyName: String = "Moon", relationship: String){
//        self.relationship = relationship
//        super.init(givenName: givenName, middleName: middleName, familyName: familyName)
//    }
//    
//    override var displayString: String {
//        return "\(super.displayString) - \(relationship)"
//    }
//}



let printAuthorsDetails: () -> Void = {
    let name = PersonName(givenName: "Keithㄱㄱㄱ", middleName: "David", familyName: "Moon")
    let author = Person(name: name)
    print(author.displayString)
}


printAuthorsDetails()

