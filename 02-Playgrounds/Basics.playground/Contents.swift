import Foundation


//runOptional()
//runFunction()
//runClass()
//runStruct()
//runEnum()
//runClosure()

//let person = Person(givenName: "Seonggyeong", familyName: "No")
//
//// 클래스의 복사는 주소의 복사, 같은 주소를 바라보게 됨. 변경 시 같이 변경
//let person2 = person
//print(person.givenName)
//print(person2.givenName)
//person2.givenName = "sg"
//print(person.givenName)
//print(person2.givenName)
//
//// ObjectIdentifier 비교
//print(person === person2)
//
//// 구조체의 복사는 값의 복사, 다른 위치에 동일한 값을 저장함
//let point = Point(x:10, y:20)
//var point2 = point
//print(point.x)
//print(point2.x)
//point2.x = 30
//print(point.x)
//print(point2.x)
////print(point === point2) 구조체는 객체 비교 불가

protocol Describable {
    var description: String { get }
}


struct Person: Describable {
    let name: String
    let age: Int
    
    var description: String {
        return "Person: \(name), \(age)"
    }
}
    
    let person = Person(name: "sg", age: 20)
    print(person.description)
    
    protocol Movable {
        func move(to point: CGPoint)
    }
    
    class Car: Movable {
        var position: CGPoint = CGPoint(x: 0, y: 0)
        func move(to point: CGPoint){
            self.position = point
            print("Car moved to \(point)")
        }
    }
    
    let car = Car()
    car.move(to: CGPoint(x: 10, y: 20))
    print(car.position)

protocol Named {
    init(name: String)
    
    func displayName() -> String
}

extension Named {
    func printDescription() {
        print(displayName())
    }
}

extension String {
    func makeUpperCase() -> String {
        return uppercased()
    }
}

class Person2: Named {
    func displayName() -> String {
        return "Person2: \(name)"
    }
    let name: String
    
    required init(name: String) {
        self.name = name
    }
}

fileprivate class Friend: Person2 {
    required init(name: String) {
        fatalError("init(name:) has not been implemented")
    }
    let age: Int
}

fileprivate struct Point: Named {
    func displayName() -> String {
        return "Point: \(name)"
    }
    
    let name: String
    
    init(name: String){
        self.name = name
    }
}

let person3 = Person2(name: "sg")
person3.printDescription()

print("car".makeUpperCase())


protocol Payable {
    func calculateWages() -> Double
}

protocol TimeOffRequestable {
    func requestTimeoff(days: Int) -> Bool
}

func processEmployee(employee: Payable & TimeOffRequestable) {
    let wages = employee.calculateWages()
    let timeOffRequest = employee.requestTimeoff(days: 10)
}

protocol Container {
    associatedtype Item
    mutating func add(_ item: Item)
    var count: Int { get }
    
}

struct IntStack: Container {
    typealias Item = Int
    private var items: [Int] = []
    
    mutating func add(_ item: Int) {
        items.append(item) }
    var count: Int {items.count}
    }

//protocol Describable {
//    var description: String { get }
//}

func printDescription<T: Describable>(_ item: T) {
    print(item.description)
}

protocol Runnable {
    func run()
}

protocol Swimmable {
    func swim()
}

protocol Flyable {
    func fly()
}

struct Bird: Flyable, Runnable {
    func fly() {print("Flying")}
    func run() {print("Running")}
}

struct Fish: Swimmable {
    func swim() {print("Swimming")}
}

struct Duck: Flyable, Runnable, Swimmable {
    func fly() {print("Flying")}
    func run() {print("Running")}
    func swim() {print("Swimming")}
}

let duck = Duck()
duck.fly()
duck.run()
duck.swim()


struct Pug {
    let name: String
}

let pugs = [Pug]() // = let pugs = Array<Pug>()

typealias Grumble = [Pug] // = Array<Pug>

var grumble = Grumble()

let marty = Pug(name: "Marty")
let wolfie = Pug(name: "Wolfie")
let buddy = Pug(name: "Buddy")

grumble.append(contentsOf: [marty, wolfie, buddy])

enum Channel {
    case BBC1
    case BBC2
    case BBCNews
    
    //...
}

class ProgrammeFetcher {
    typealias FetchResultHandler = (String?, Error?) -> Void
    
    func fetchCurrentProgrammeName(forChannel channel: Channel, resultHandler: FetchResultHandler) {
        
        // 현재 프로그램을 가져오는 작업 수행
        let exampleProgramName = "Sherlock"
        resultHandler(exampleProgramName, nil)
        
        //프로그램 정보가 없을 때 에시
        // resultHandler(nil,nil)
    }
    
    func fetchNextProgramName(forChannel channel: Channel, resultHandler: FetchResultHandler){
        // 다음 프로그램을 가져오는 작업 수행
        let exampleProgramName = "Luther"
        resultHandler(exampleProgramName, nil)
    }
    
}

let fetcher = ProgrammeFetcher()
fetcher.fetchCurrentProgrammeName(forChannel: .BBC1, resultHandler: { programName, error in
    guard let programName else {
        print("No programme found")
        return
    }
    guard error == nil else {
        print("Error fetching programme: \(error!)")
        return
    }
    
    print(programName)
})

class Manager {
    var currentUserName: String = "홍길동" {
        
        
        // 변경 직후에
        didSet { // oldValue 파라미터는 생략가능 = 기본 매개변수
            print("새 이름: '\(currentUserName)'이 '\(oldValue)'에서부터 변경되었습니다.")
        }
        
        // 변경 직전에
        willSet(newValue1) { // newValue(기본 매개변수)는 생략가능 생략하지 않으면 다른 이름으로 지정 가능.
            print("기존 '\(currentUserName)'이 '\(newValue1)'으로 변경 됩니다.")
        }
       
    }
    init(_ currentUserName: String){
        self.currentUserName = currentUserName
    }
    func changeManage(_ name: String) {
        self.currentUserName = name
    }
}
let manager = Manager("낄끼루")
manager.currentUserName = "담길동"

// 제어 흐름

enum PoolBallType: String {
    case solid
    case stripe
    case black
}

func poolBallType(forNumber number: Int) -> PoolBallType? {
    if number < 8 && number > 0 {
        return .solid
    } else if number > 8 && number < 16 {
        return .stripe
    } else if number == 8 {
        return .black
    } else{
        return nil
    }
}

func printBallDetails(ofNumber number:Int) {
    let possibleBallType = poolBallType(forNumber: number)
    if let ballType = possibleBallType {
        print("\(number) - \(ballType.rawValue)")
    }else {
        print("\(number) is not a valid pool ball number")
    }
}

let two = poolBallType(forNumber: 2)
let eight = poolBallType(forNumber: 8)
let twelve = poolBallType(forNumber: 12)

let zero = poolBallType(forNumber: 0)
let sixteen=poolBallType(forNumber: 16)

printBallDetails(ofNumber: 2)
printBallDetails(ofNumber: 8)
printBallDetails(ofNumber: 12)
printBallDetails(ofNumber: 0)
printBallDetails(ofNumber: 16)

class PoolFrame {
    var player1BallType: PoolBallType?
    var player2BallType: PoolBallType?
}
class PoolTable {
    var currentFrame: PoolFrame?
}
func printBallTypeOfPlayer1(forTable table: PoolTable) {
  // 옵셔널 언래핑 체이닝 . ,으로 두개를 선언했음.
    if let frame = table.currentFrame, let ballType = frame.player1BallType {
        print(ballType.rawValue)
    } else {
        print("Player 1 has no ball type or there is no current frame")
    }
}

// 진행 중인 프레임이 없는 테이블
let table = PoolTable()
table.currentFrame = nil
printBallTypeOfPlayer1(forTable: table)
// Player 1 has no ball type or there is no current frame

// 진행 중인 프레임이 있지만 넣은 공이 없는 테이블
let frame = PoolFrame()
frame.player1BallType = nil
frame.player2BallType = nil
table.currentFrame = frame
printBallTypeOfPlayer1(forTable: table)
// Player 1 has no ball type or there is no current frame

// 진행 중인 프레임이 있고 공이 넣어진 테이블
frame.player1BallType = .solid
frame.player2BallType = .stripe
printBallTypeOfPlayer1(forTable: table)
// solid


enum CompassPoint {
    case north
    case south
    case east
    case west
}

func lookTowards(_ direction: CompassPoint) {
    switch direction {
    case .north:
        print("북쪽으로는 구불구불한 길이 있습니다.")
    case .south:
        print("남쪽에는 프랜싱 포니 선술집이 있습니다.")
    case .east:
        print("동쪽에는 대장간이 있습니다.")
    case .west:
        print("서쪽에는 마을 광장이 있습니다.")
    }
}

lookTowards(.south)


enum Item {
    case key
    case lockedDoor
    case openDoor
    case bluntKnife
    case sharpenigStone
    case sharpKnife
}

func combine(_ firstItem: Item, with secondItem: Item) -> Item? {
    switch (firstItem, secondItem){
    case (.key, .lockedDoor) :
        print("문을 열었습니다!")
        return .openDoor
    case (.bluntKnife, .sharpenigStone):
        print("칼이 날카로워졌습니다.")
        return .sharpKnife
    default:
        print("\(firstItem)과 \(secondItem)은 결합할 수 없습니다.")
        return nil
    }
}

let door = combine(.key, with: .lockedDoor)
let oilAndWater = combine(.bluntKnife, with: .lockedDoor)


//for
let ledZepplin = ["Robert", "Jimmy", "John", "John Paul"]

for musician in ledZepplin {
    print(musician)
}

for value in 1...12 {
    print("5 x \(value) = \(value * 5)")
}
let zeppelinByInstrument = ["vocals": "Robert",
                            "lead guitar" : "Jimmy",
                            "drums": "John",
                            "bass guitar": "John Paul"
]

for (key, value) in zeppelinByInstrument {
    print("\(value)가 \(key)를 연주합니다.")
}

print(422)
print(ledZepplin.forEach {musician in print(musician)})
print(ledZepplin.forEach {print($0)})




//while

enum CoinFlip: Int {
    case heads
    case tails
    
    static func flipCoin() -> CoinFlip {
        return CoinFlip(rawValue: Int.random(in:0...1))!
    }
}

func howManyHeadsInARow() -> Int {
    var numberOfHeadsInARow = 0
    var currentFlip: CoinFlip = CoinFlip.flipCoin()
    var 동전앞뒤: String = ""
    if (currentFlip.rawValue == 0){
        동전앞뒤 = "앞면"
        numberOfHeadsInARow += 1
    } else {
        동전앞뒤 = "뒷면"
    }
    
    print("처음 나온 동전: \(동전앞뒤)")
    while currentFlip == .heads {
        numberOfHeadsInARow += 1
        currentFlip = CoinFlip.flipCoin()
        print("동전 앞면이 나왔습니다.")
    }
    
    return numberOfHeadsInARow
}

let noOfHeads = howManyHeadsInARow()
print("앞면이 나온 횟수\(noOfHeads)")


///
///

enum MealState {
    case initital
    case buyIngerdIents
    case prepareIngredients
    case cook
    case plateUp
    case serve
}

enum MealError: Error {
//    case canOnlyMoveToAppropriateState
    case canOnlyMoveToAppropriateState(from: MealState, to: MealState)
    case tooMuchSalt
    case worngStateToAddSalt
}

class Meal{
    private(set) var state: MealState = .initital
    private(set) var saltAdded = 0
    func change(to newState: MealState) throws {
        switch (state, newState){
        case (.initital, .buyIngerdIents),
            (.buyIngerdIents, .prepareIngredients),
            (.prepareIngredients, .cook),
            (.cook, .plateUp),
            (.plateUp, .serve):
            state = newState
        default:
//            throw MealError.canOnlyMoveToAppropriateState
            throw MealError.canOnlyMoveToAppropriateState(from: state, to: newState)
        }
    }
    
    func addSalt() throws{
        if saltAdded >= 5 {
            throw MealError.tooMuchSalt
        } else if .initital == state ||
                  .buyIngerdIents == state{
            throw MealError.worngStateToAddSalt
        } else {
            saltAdded += 1
        }
            
    }
    func buyIngredients() throws {
        try change(to: .buyIngerdIents)
    }
    func prepareIngredients() throws {
        try change(to: .prepareIngredients)
    }
    func cook() throws {
        try change(to: .cook)
    }
    func plateUp() throws {
        try change(to: .plateUp)
    }
    func serve() throws {
        try change(to: .serve)
    }
    
}
let dinner = Meal()

do {
    print("buyIngredients")
    try dinner.change(to: .buyIngerdIents)
    print("prepareIngredients")
    try dinner.change(to: .prepareIngredients)
  
    print("cook")
    try dinner.change(to: .cook)
    print("plateUp")
    try dinner.change(to: .plateUp)
    print("serve")
    try dinner.change(to: .serve)
   
    print("저녁 식사가 준비되었습니다!")
} catch MealError.canOnlyMoveToAppropriateState(let from, let to){
    print("\(from) -> \(to) 상태로 이동할 수 없습니다.")
} catch MealError.tooMuchSalt {
    print("짜다!")
} catch MealError.worngStateToAddSalt {
    print("이 단계에서는 소금을 추가할 수 없습니다.")
}

catch let error {
    print("error: \(error)")
}

//let meal = Meal()
