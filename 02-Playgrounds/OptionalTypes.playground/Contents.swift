import UIKit

var index: Int?
index = 3

var treeArray = ["Oak", "Apple", "Banana", "Birch"]


if index != nil {
//    print("값이 할당되어있을 때")
    print(treeArray[index!]) // 강제 언래핑
} else {
    print("값이 할당되지 않음")
        
}


// 조건부 언래핑
// if let index = index => 축약해서 사용가능.
if let index {
    // 이 중괄호 안에서는 옵셔널이 아닌 Int 타입으로 사용 가능
    print(treeArray[index])
}

var optionalName1: String?
var optionalName2: String?
var optionalName3: String?

optionalName1 = "Swift"
optionalName2 = "Programming"
optionalName3 = "Language"

if let name1 = optionalName1,
   let name2 = optionalName2,
   let name3 = optionalName3 {
    print("\(name1) \(name2) \(name3)")
}


// value를 정수값으로 지정을 하더라도 Dictionary에서 optional value를 return 함 . 타입이 없을 수도 있기 때문에 (키는 있지만 value는 nil)
var myDictionary = [String: Int]()
myDictionary["Swift"] = 100
myDictionary["Programming"] = 200
myDictionary["Language"] = 300

// 딕셔너리의 값 액세스는 값이 없을 수 있기 때문에, 옵셔널 타입으로 값을 전달
print(myDictionary["C++"] ?? 0 ) // 기본 값
if let value = myDictionary["C++"] {
    print(value)
} else {
    print(0)
}

// 강제 언래핑인데 타입까지 지정할 수 있음.
// 타입 캐스팅
let value = myDictionary["Swift"] as! Int
print(value)


//UIView  -> UIControl ->  UIButton 순으로 상속 관계
let myButton: UIButton = UIButton()
let myControl = myButton as UIControl // 타입 캐스팅 ( 업 캐스팅 )

// UIScrollView -> UITextView
let myScrollView: UIScrollView = UIScrollView()
//let myTextView = myScrollView as! UITextView // 타입 캐스팅 ( 다운 캐스팅 ) 컴파일러 : 복잡한 구조여서 사용할 수 없는데 강제로 다운캐스팅 가능. 강제 타입 캐스팅


// 조건부 타입 캐스팅
if let myTextView = myScrollView as? UITextView {
    print(myTextView.text ?? "")
} else {
    print("UITextView 로 타입캐스팅 하지 못했습니다.")
}

// ClosedRange
let closedrange = 1...5 //

// Range
let range = 1..<5

// PartialRangeFrom
let range2 = 1...

// PartialRangeThrough
let range3 = ...5

// PartialRangeUpTo
let range4 = ..<5

print(closedrange)
print(range)
print(range2)
print(range3)

