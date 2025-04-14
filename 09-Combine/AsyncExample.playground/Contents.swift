import Foundation

// 고객과 샌드위치 제작자의 메시지 출력함수
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

// 비동기적으로 빵을 토스트하는 함수
func toastBread(_ bread: String) async -> String {
    sandwichMakerSays("빵을 토스트하는 중.... 기다리는 중....")
    try? await Task.sleep(nanoseconds: 5_000_000_000) // 5초 대기
    return "바삭한 \(bread)"
}

// 비동기 적으로 재료를 자르는 함수
func slice(_ ingredients: [String]) async -> [String] {
    var result = [String]()
    for ingredient in ingredients {
        sandwichMakerSays("\(ingredient) 자르는 중")
        try? await Task.sleep(nanoseconds: 1_000_000_000) // 1초 대기
        result.append("자른 \(ingredient)")
    }
    return result
}

// 비동기적으로 샌드위치를 만드는 함수
func makeSandwich(bread: String, ingredients: [String], condiments: [String]) async -> String {
    sandwichMakerSays("샌드위치 준비 중...")
    
    // 빵 토스트와 재료 자르기를 병렬로 실행
    async let toasted = toastBread(bread)
    async let sliced = slice(ingredients)
    
    sandwichMakerSays("(\(await toasted)에 \(condiments.joined(separator: ",  "))를 바르는 중")
    sandwichMakerSays("\(await sliced.joined(separator: ", ")), \(condiments.joined(separator: ",  "))")
}


