struct SampleStruct {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func buildHelloMsg() -> String {
        // 함수의 한줄 실행구문(줄)의 결과가 함수의 반환타입과 일치하는 경우 return이 생략가능
//        return "Hello " + name
        "Hello, \(name)"
    }
}

class SampleClass {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    
    func buildHelloMsg() -> String {
        return "Hello " + name
    }
    
}

let myStruct1 = SampleStruct(name: "Mark")
var myStruct2 = myStruct1
myStruct2.name = "David"

print(myStruct1.name)
print(myStruct2.name)

// 참조 타입
let myClass1 = SampleClass(name: "Mark")
var myClass2 = myClass1
myClass2.name = "David"

enum Temperature {
    case hot
    case warm
    case cold(centigrade: Int)
}

func displayTempInfo(temp: Temperature) {
    switch temp {
    case .hot:
        print("Hot")
    case .warm:
        print("Warm")
    case .cold(let centigrade) where centigrade <= 0:
        print("Ice warning: \(centigrade) degrees.")
    case .cold:
        print("It is cold but not freezing.")
    }
}

displayTempInfo(temp: Temperature.cold(centigrade: -10))
