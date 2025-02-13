
// Camel case
class BankAccount {
    var accountBalances: Float = 0 // 잔액
    var accountNumber: Int = 0
    let fees: Float = 25.00
    
    init(number: Int, balance: Float) {
        self.accountNumber = number
        self.accountBalances = balance
    }
    
    func displayBalance() {
        print("Account number is \(accountNumber)")
        print("Your balance is \(balanceLessFees)")
    }
    
    class func getMaxBalance() -> Float {
        return 100000.00
    }
    
    
    // computed property (연산 프로퍼티)
    var balanceLessFees: Float {
        
        get{
            return accountBalances - fees
        }
    }
}

let account1 = BankAccount(number: 1, balance: 100000 )
account1.displayBalance()
print(BankAccount.getMaxBalance())


class MyClass1 {
    let title: String
    // 즉시 실행함수(클로저)로 변수를 초기화 하는 코드
    lazy var myProperty: String = {
        var result = resourceIntensiveTask()
        result = processData(data: result)
        return result
    }()
        // 오래 걸리는 함수 예시
    func resourceIntensiveTask() -> String {
        return "Hello World!"
    }
    
    func processData(data: String) -> String {
        return data + "!"
    }
    
    init(title: String) {
        self.title = title
    }
 
}


protocol MessageBuilder {
    var name: String { get }
    func buildMessage() -> String
}


// 프로토콜을 준수하는 클래스를 정의함. (프로토콜에 선언되어있는 변수와 메서드를 구현)
class MyClass: MessageBuilder {
    var name: String
    
    init(name: String){
        self.name = name
    }
    func buildMessage() -> String {
        "Hello " + name
    }
}

func doubleFunc1(value: Int) -> some Equatable  {
    return value * 2
}

func doubleFunc2(value: String) -> some Equatable {
    value + value
}

let intOne = doubleFunc1(value: 10)
let stringOne = doubleFunc2(value: "Hello")

class SavingsAccount: BankAccount {
    var interestRate: Float = 0.0
    
    init(number: Int, balance: Float, rate: Float) {
        self.interestRate = rate
        super.init(number: number, balance: balance)
    }
    func calculateInterest() -> Float {
        return interestRate * accountBalances
    }
    
    override func displayBalance() {
        super.displayBalance()
        print("현재 이자율: \(interestRate)")
    }
}

let savings1 = SavingsAccount(number: 12312312, balance: 400.54, rate: 0.05)
print(savings1.calculateInterest())
savings1.displayBalance()

extension Double {
    var squared: Double {
        return self * self
    }
    
    var cubed: Double {
        return self * self * self
    }
}

let number: Double = 10.0
print(number.squared)
print(number.cubed)
