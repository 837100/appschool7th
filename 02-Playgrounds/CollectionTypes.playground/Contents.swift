import Foundation

var tree: [String] = ["Pine", "Oak", "Yew"]
var tree2: Array<String> = ["Pine", "Oak", "Yew"] // 둘이 같은 코드

var emptryArray: [String] = []
var emptyArray2 = Array<String>()

//var nameArray = Array<String>(repeating: "My String", count: 10)
var nameArray = [String](repeating: "My String", count: 10)

var firstArray = ["Red", "Green", "Blue"]
let secondArray = ["Indigo" , "Violet"]
let thirdArray = firstArray + secondArray + tree

firstArray.append("Orange")
print(thirdArray.count)

if !thirdArray.isEmpty{
    print("thirdArray는 비어있지 않습니다.")
}

if thirdArray.contains("Oak"){
    print("thirdArray는 \"Oak\"를 가지고 있습니다.")
}


// 배열 인덱스 1번에 "Maple" 값을 추가 (배열의 인덱스 1번은 2번째 요소임.)
firstArray.insert("Maple", at: 1)

// 1000 > 1004 > 1008 > 1012
// 0*4 > 1*4 > 2*4 > 3*4
firstArray += secondArray

firstArray.remove(at: 1)

firstArray.removeAll(where: {$0 == "Blue"})

let removeItem = firstArray.removeLast()
print("removeItem = \(removeItem)")

firstArray.removeAll()

secondArray.forEach( {print($0)})

for item in secondArray {
    print(item)
}

let uppercasedSecondArray = secondArray.map{$0.uppercased()}
print(uppercasedSecondArray)

let filteredSecondArray = secondArray.reduce(into: []) { result, item in
    if item.count > 3 {
        result.append(item)
    }
    
}
print(filteredSecondArray)


let mixedArray: [Any] = ["A String", 432,34.989]

for object in mixedArray {
    // 조건부 타입 캐스팅
    if let intValue = object as? Int {
        print(intValue)
    } else if let doubleValue = object as? Double{
        let roundedValue = doubleValue.rounded()
        print(roundedValue)
    } else if let stringValue = object as? String {
        print(stringValue)
    }
}

// Dictionary
var BookDic = [
    "100-432112" : "Wind in the Wilows",
    "200-532874" : "Tale of Two Cities",
    "202-546549" : "Sense and Sensibility",
    "104-109834" : "Shutter Island"
]
var myDictionary = [Int: String]()

let keys = ["100-432112", "200-532874", "202-546549", "104-109834"]
let values = ["Wind in the Williows", "Taile of Two Cities", "Sense and Sensibility", "Shutter Island"]
var bookDict = Dictionary(uniqueKeysWithValues: zip(keys, values))
print(bookDict.count)
print(bookDict["200-532874"] ?? "Book not found")
bookDict.updateValue("The Ruins" , forKey: "200-532874")
bookDict["300-898871"] = "The Overlook"
bookDict["300-898871"] = nil // 값 제거
bookDict.removeValue(forKey: "300-898871")

for (key, value) in bookDict {
    print("key: \(key), value: \(value)")
}
