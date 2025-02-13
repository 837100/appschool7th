import Foundation

public func runEnum(){
    
    enum CompassDirection {
        case north
        case south
        case east
        case west
    }
    
    
//    let otherDirection: CompassDirection = CompassDirection.east
//
//    // enum 이름을 생략할 수 있다. 타입을 지정했으므로 키워드를 생략가능.
//    let direction: CompassDirection = .east
    
//    
//    switch direction {
//    case .north: print("북")
//    case .south: print("남")
//    case .east: print("동")
//    case .west: print("서")
//    }
    
    // enum은 연관 값을 가질 수 있음. 선택의 옵션까지 가질 수 있음
    enum Barcode {
        case qrCode(String)
        case barCode(String)
        case upc(Int, Int, Int, Array<Int>)
    }
    
    let productBarcode: Barcode = .qrCode("Hello")
    let productBarcode2: Barcode = .barCode("World")
    let productBarcode3: Barcode = .upc(1, 2, 3, [4,6,7])
    print(productBarcode)
    print(productBarcode2)
    print(productBarcode3)
    
    enum Title: String{
        case mr = "Mr."
        case ms = "Ms."
        case rms = "Mrs."
        case dr = "Dr."
        case other
    }
    
    let title: Title = .mr
    print(title)
    print(title.rawValue)
    
    enum Gender: Int {
        case male = 1
        case female = 2
        case other
    }
    
    let gender: Gender = .other
    print(gender.rawValue)
    
    
    ///얼거형
    ///- 대문자로 시작하는 것이 관례
    ///- case는 값
    ///- 연관 값을 이용하면 추가정보를 저장할 수 있다.
    ///- 열거형 값을 원시타입(Int,Float,Bool,Double,String)의 값으로 지정할 수 있다.
    ///- 원시타입 값 확인 방법: .rawValue
    enum Planet: String {
        case mercury, venus, earth,mars,jupiter,saturn,uranus,neptune
        
        func surfaceGravity() -> Double {
            switch self{
            case .mercury: return 3.7
            case .venus: return 8.87
            case .earth: return 9.8
            case .mars: return 3.721
            case .jupiter: return 24.79
            case .saturn: return 10.44
            case .uranus: return 8.69
            case .neptune: return 11.15
            }
        }
    }
    let earth = Planet.earth
    print(earth.surfaceGravity()) // 9.8
}
