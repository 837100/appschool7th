import Combine
import PlaygroundSupport

// Playground 가 비동기 코드를 실행할 수 있도록 설정
PlaygroundPage.current.needsIndefiniteExecution = true

// ==== 예제 1: sink Subscriber - 기본형 ====
print("\n 1 sink Subscriber - 기본형")
print("--------------")

let numbersPublisher = [10, 20, 30, 40, 50].publisher

// sink는 가장 기본적인 Subscriber
// 값을 받아서 클로저 내에서 처리합니다.
let basicSink = numbersPublisher.sink { number in
    print("기본 sink로 받은 값 : \(number)")
}

basicSink.cancel() // sink는 사용 후 cancel해줘야 합니다.

// ==== 예제 2: sink Subscrber - 완료 처리 추가 ====
print("\n2 sink Subscriber - 완료 이벤트 처리")
print("--------------------------")

// 완료 이벤트도 처리하는 sink
let completionSink = numbersPublisher.sink(
    receiveCompletion: {completion in
        switch completion {
        case .finished:
            print("모든 값 수신 완료!")
        case .failure(let error):
            print("오류 발생: \(error)")
        }
    },
    receiveValue: { number in
        print("값 수신: \(number)")
    })

// 데이터 저장용 클래스
class UserProfile {
    var name: String = ""
    var age: Int = 0
    
    func display() {
        print("사용자 정보: 이름 = \(name), 나이 = \(age)")
    }
}

// === 예제 3: assign Subscriber - 속성에 할당 ====
print("\n3 assign Subscriber - 객체의 속성에 직접 할당")
print("-----------------------------------------")

let profile = UserProfile()

// 문자열 배열을 발행하는 Publisher
let namesPublisher = ["김민준", "이지현", "박준호"].publisher

// 각 값이 할당될 때마다 확인
namesPublisher.sink { name in
    print("현재 이름: \(profile.name) (방금 할당된 값: \(name))")
}

// assign은 Publisher의 값을 객체의 속성에 직접 할당합니다
print("현재 이름: \(profile.name)")
let nameAssign = namesPublisher.assign(to: \.name, on: profile)

print("현재 이름: \(profile.name)")

// === 예제 4: 커스텀 Subscriber 만들기 ===
print("\n4 커스텀 Subscriber - 나만의 Subscriber 만들기")
print("--------------------------------------")

// 간단한 커스텀 Subscriber 클래스
class SimpleSubscriber: Subscriber {
    // 값과 오류 타입 정의
    typealias Input = Int
    typealias Failure = Never
    
    // 구독 시작 시 호출 됨
    func receive(subscription: Subscription) {
        print("구독 시작!")
        // 값을 무제한으로 요청 (backpressure 관리)
        subscription.request(.unlimited)
    }
    
    // 값 수신 시 호출됨
    func receive(_ input: Int) -> Subscribers.Demand {
        print("커스텀 Subscriber가 받은 값: \(input)")
        // 추가 값을 요청하지 않음
        return .none
    }
    
    // 완료 시 호출됨
    func receive(completion: Subscribers.Completion<Never>) {
        print("구독 완료")
    }
}

// 커스텀 Subscriber 사용
print("값 부른다?")
let customSubscriber = SimpleSubscriber()
[100, 200, 300].publisher.subscribe(customSubscriber)

// ==== 예제 5: Demand(요청량) 관리하기 ====
print("\n5 Demand 관리 - 값 요청량 조절하기")
print("------------------------------")

// 수용량을 관리하는 커스텀 Subscriber
class LimitedSubscriber: Subscriber {
    typealias Input = String
    typealias Failure = Never
    
    // 요청 개수를 저장
    private var totalDemand = 0
    private let maxDemand = 2
    
    func receive(subscription: Subscription) {
        print("최초 2개 값만 요청")
        // 처음에 2개만 요청
        totalDemand = 2
        // 구독자에게 요청량을 전달
        subscription.request(.max(2))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("받은 값: \(input), 남은 수용량: \(maxDemand - totalDemand + 1)")
        
        // 모든 수용량을 사용했으면 더 요청하지 않음
        totalDemand -= 1
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("구독 완료")
    }
}

// 여러 값을 발행하는 Publisher
let fruitsPublisher = ["사과", "바나나", "딸기", "오렌지", "포도"].publisher
fruitsPublisher.subscribe(LimitedSubscriber())
print("fruitsPublisher.subscribe(LimitedSubscriber()) 끝")
fruitsPublisher.sink { fruit in
    print("발행된 과일: \(fruit)")
}
