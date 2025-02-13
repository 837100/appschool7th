// 함수 선언 부분
func sayHello() -> Void{
    print("Hello")
    // return이 없음. Void
}

// 함수 실행 부분
sayHello()

func buildMessageFor(name: String, count: Int) -> String{
    return "\(name) has bought \(count) books"
}

let message = buildMessageFor(name: "Apple", count: 3)
print(message)

func buildMessageFor(userName name: String , userCount count: Int) -> String {
    return "\(name), you are customer number \(count)"
}
let message1 = buildMessageFor(userName: "John" , userCount: 100)

func buildMessageFor(_ name: String = "Customer", count: Int) -> String {
    return "\(name), you are customer number \(count)"
}

let message3 = buildMessageFor(count:100)
let message4 = buildMessageFor("아무개", count: 100)
print(message3)
print(message4)

// 가변 파라미터 가변 파라미터의 가변 파라미터의 뒤에 파라미터를 만들 경우 이름을 생략할 수 없음. 어디까지 끝어야 할 수 없으니까
func displayStrings(_ strings: String... , counts: Int...) {
    for string in strings { // strings [String]
        print(string)
    }
    print("count: \(counts)")
}

displayStrings("Hello", "World", "Swift", "Programming", counts:1,2,3)


// inout 키워드: 파라미터 값을 외부에도 적용해주는 키워드 c언어의 포인터
func doubleValue(_ value: inout Int)  /*-> Void */ {
    value *= 2
    print(value)
}
var myvalue = 10
doubleValue(&myvalue)
print(myvalue)

func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

let mathFunction: (Int, Int) -> Int = add
print(mathFunction(2,3)) // 5

let multiply = { (a: Int, b: Int) -> Int in
    return a * b
}

print(multiply(2,3))



func performOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int ) -> Int {
    return operation(a, b)
}

let result = performOperation(4, 5, operation: multiply)
print("result = \(result)")
print(performOperation(4, 5){ $0 + $1 })

func makeIncrementer(incrementAmount: Int) -> () -> Int {
    var total = 0
    let incrementer: () -> Int = {
        total += incrementAmount
        return total
    }
    return incrementer
}

let incrementByTen = makeIncrementer(incrementAmount: 10)
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())
