import Foundation

// 고객 메시지 출력 함수
public func customerSays(_ message: String) {
    print("[Customer] \(message)")
}

// 샌드위치 제작자 메시지 출력함수
public func sandwichMakerSays(_ message: String, waitFor time: UInt32 = 0 ) {
    print("[SandWich maker] \(message)")
    if time > 0 {
        print("  ............ this will take \(time)s")
        sleep(time)
    }
}

// 샌드위치 만들기 함수
func makeSandwich(bread: String, ingredients: [String], condiments: [String]) -> String {
    sandwichMakerSays("Preparing your sandwich..")
    let toasted = toastBread(bread)
    let sliced = slice(ingredients)
    sandwichMakerSays("Spreading \(condiments.joined(separator: ", and)")) on \(toasted)")
    return "\(ingredients.joined(separator: ", ")), \(condiments.joined(separator: ", ")) on \(toasted)"
}

// 빵을 굽는 함수
func toastBread(_ bread: String) -> String {
    sandwichMakerSays("Toasting the bread... Standing by...", waitFor: 5)
    return "Crispy \(bread)"
}

// 재료를 자르는 함수
func slice(_ ingredients: [String]) -> [String] {
    let result = ingredients.map { ingredient in
        sandwichMakerSays("Slicing \(ingredient)", waitFor: 1)
        return "sliced \(ingredient)"
    }
    return result
}

// 메인 프로그램은 다음과 같습니다.
sandwichMakerSays("안녕하세요! 서브웨이입니다. 주문은 여기서 해주세요")
sandwichMakerSays("빵은 어떤걸로 하시겠어요? ...")
// 우리는 샌드위치를 만드는데 걸린 시간을 측정하기 위해 ContinuousClock을 사용하고 있습니다.
let clock = ContinuousClock()
let time = clock.measure {
    let sandwich = makeSandwich(bread: "Rye", ingredients: ["customers","tomatos"], condiments: ["Mayo","Mustard"])
    customerSays("음 이건 맛있어보이는 군 \(sandwich) 샌드위치!")
}
// 이 작업은 약 7초정도 걸립니다.
print("Making this snadwich took \(time)")
