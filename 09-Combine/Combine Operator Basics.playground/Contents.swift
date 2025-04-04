import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//// ==== 예제 1: map - 값 변환하기 ====
//print("\n1 map - 값을 다른 형태로 변환하기")
//print("-----------------------------")
//
//let numbersPublisher = [1,2,3,4,5].publisher
//
//// map 연산자: 각 값을 변환합니다. (여기서는 제곱)
//let squaredNumbers = numbersPublisher
//    .map { number in
//        return number * number
//    }
//    .sink { squaredNumber in
//        print("원래 숫자의 제곱: \(squaredNumber)")
//    }
//
//// ==== 예제 2: filter - 값 걸러내기 ====
//print("\n2 filter - 조건에 맞는 값만 통과시키기")
//print("-------------------------------")
//
//let mixedNumbers = [1,2,3,4,5,6,7,8,9,10].publisher
//
//// filter 연산자: 조건에 맞는 값만 통과시킵니다. (여기서는 짝수만)
//let evenNumbers = mixedNumbers
//    .filter  { number in
//        return number % 2 == 0 // 짝수만 통과
//    }
//    .sink { evenNumber in
//        print("짝수: \(evenNumber)")
//    }

print("\n3 removeDuplicates - 연속된 중복 값 제거하기")
print("----------------------------------")

let repeatedValues = [1,1,2,2,2,3,3,1,1].publisher

// removeDuplicates 연산자: 중복 값을 제거합니다.
let uniqueValues = repeatedValues
    .removeDuplicates()
    .sink { value in
        print("중복 제거 후 값: \(value)")
    }

// MARK: - 1. 커스텀 RemoveDuplicates 연산자 구현

extension Publishers {
    struct CustomRemoveDuplicates<Upstream: Publisher>: Publisher {
        typealias Output = Upstream.Output
        typealias Failure = Upstream.Failure
        
        private let upstream: Upstream
        private let predicate: (Output, Output) -> Bool
        
        init(upstream: Upstream, predicate: @escaping (Output, Output) -> Bool) {
            self.upstream = upstream
            self.predicate = predicate
        }
        
        func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
            let inner = RemoveDuplicatesSubscriber(downstream: subscriber, predicate: predicate)
            upstream.subscribe(inner)
        }
    }
    
    private final class RemoveDuplicatesSubscriber<S: Subscriber, T>: Subscriber
    where S.Input == T {
        typealias Input = T
        typealias Failure = S.Failure
        
        private let downstream: S
        private let predicate: (T, T) -> Bool
        private var latestValue: T?
        
        init(downstream: S, predicate: @escaping (T, T) -> Bool) {
            self.downstream = downstream
            self.predicate = predicate
        }
        
        func receive(subscription: Subscription) {
            downstream.receive(subscription: subscription)
        }
        
        func receive(_ input: T) -> Subscribers.Demand {
            if let latest = latestValue {
                if !predicate(latest, input) {
                    latestValue = input
                    return downstream.receive(input)
                }
                return .none
            } else {
                latestValue = input
                return downstream.receive(input)
            }
        }
        
        func receive(completion: Subscribers.Completion<Failure>) {
            downstream.receive(completion: completion)
        }
    }
}

// MARK: - 2. Publisher에 customRemoveDuplicates 확장 추가

extension Publisher {
    func customRemoveDuplicates(by predicate: @escaping (Output, Output) -> Bool) -> Publishers.CustomRemoveDuplicates<Self> {
        return Publishers.CustomRemoveDuplicates(upstream: self, predicate: predicate)
    }
}

// MARK: - 3. Equatable 타입을 위한 간편 버전 추가

extension Publisher where Output: Equatable {
    func customRemoveDuplicates() -> Publishers.CustomRemoveDuplicates<Self> {
        return customRemoveDuplicates(by: ==)
    }
}

// MARK: - 4 . 테스트용 모델

struct Person: Equatable {
    let id: Int
    let name: String
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: -5 . 비교 테스트

// 테스트 데이터 준비
let numbers = [1,2,2,3,3,3,4,5,5,1]
let people = [
    Person(id: 1, name: "Kim"),
    Person(id: 2, name: "Lee"),
    Person(id: 2, name: "Lee"),
    Person(id: 3, name: "Choi"),
    Person(id:3, name: "Jung"),
]

print("==== 테스트 1: 기본 Int 타입 비교 ====")

// 1. 기존 Combine의 removeDuplicates 사용
print("1. 기존 Combine의 removeDuplicates:")
var cancellables = Set<AnyCancellable>()

numbers.publisher
    .removeDuplicates()
    .sink { value in
        print("받은 값: \(value)")
    }
    .store(in: &cancellables)

// 2. 커스텀 removeDuplicates 사용
print("\n2. 커스텀 removeDuplicates:")
numbers.publisher
    .customRemoveDuplicates()
    .sink { value in
        print("받은 값: \(value)")
    }
    .store(in: &cancellables)

print("\n==== 테스트 2: 커스텀 객체 비교 ====")

// 3. 기존 removeDuplicates로 Person 객체 비교
print("3. 기존 removeDuplicates로 Person 비교:")
people.publisher
    .removeDuplicates()
    .sink { person in
        print("받은 값: ID \(person.id), 이름: \(person.name)")
    }
    .store(in: &cancellables)

// 4. 커스텀 removeDuplicates로 Person 객체 비교
print("\n4. 커스텀 removeDuplicates로 Person 비교:")
people.publisher
    .customRemoveDuplicates()
    .sink { person in
        print("받은 값 : ID \(person.id), 이름 : \(person.name)")
    }
    .store(in: &cancellables)

print("\n==== 테스트 3: 커스텀 조건으로 비교 ====")

// 5. 기존 removeDuplicates로 커스텀 조건 사용
print("5. 기존 removeDuplicates로 커스텀 조건:")
numbers.publisher
    .removeDuplicates(by: { abs($0 - $1) < 2})
    .sink { value in
        print("받은 값: \(value)")
    }
    .store(in: &cancellables)

// 6. 커스텀 removeDuplicates로 커스텀 조건 사용
print("\n6. 커스텀 removeDuplicates로 커스텀 조건:")
numbers.publisher
    .customRemoveDuplicates(by: {abs($0 - $1) < 2})
    .sink { value in
        print("받은 값: \(value)")
    }
    .store(in: &cancellables)
