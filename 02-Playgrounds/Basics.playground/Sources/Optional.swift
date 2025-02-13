
import Foundation

public func runOptional() {
    // 옵셔널
    var dayOfTheWeek: String = "Monday"
    dayOfTheWeek = "Tuesday"
    print(dayOfTheWeek)
    dayOfTheWeek = "Wednesday"
    print(dayOfTheWeek)
    //dayOfTheWeek = nil 컴파일 시 오류 발생
    dayOfTheWeek = "" // 빈 문자열이 최선


    var numberOfFingersHeldUpByFinn: Int?
    numberOfFingersHeldUpByFinn = nil
    //print(numberOfFingersHeldUpByFinn)
    print(numberOfFingersHeldUpByFinn ?? "모름")
    numberOfFingersHeldUpByFinn = 3
    //print(numberOfFingersHeldUpByFinn)



    // 강제 언래핑
//    let lastNumberOfFingerHeldUpByFinn: Int = numberOfFingersHeldUpByFinn!

    // 조건부 언래핑
    if let numberOfFingerHeld = numberOfFingersHeldUpByFinn{
        //값이 nil이 아니면 실행
        print(numberOfFingerHeld)
    } else {
        print("모름")
    }

//     guard
//    guard let numberOfFingersHeld = numberOfFingersHeldUpByFinn else {
//        //값이 없으면 실행
//        print("모름")
//        return
//    }

    guard let numberOfFingersHeldUpByFinn else {
        print("모름")
        return
    }
    print(numberOfFingersHeldUpByFinn)
}
