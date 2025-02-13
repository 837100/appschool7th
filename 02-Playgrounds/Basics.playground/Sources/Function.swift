//
//  Function.swift
//  
//
//  Created by SEONGGYEONG NO on 12/31/24.
//
import Foundation


public func runFunction() {
    func fullName(이름 givenName: String = "길동",
                  중간이름 middleName: String? = nil,
                  성 familyName: String = "홍") -> String {
        var fullName = familyName
        if let middleName {fullName += "\(middleName)"}
        fullName += "\(givenName)"
        return fullName
    }
    //let myFullName = fullName(givenName:"John",middleName: "Doe", familyName :"rei")
    let myFullName = fullName(이름:"John",중간이름: "Doe", 성 :"rei")
    print(myFullName)
    
    //함수의 레이블 생략 = 아무것도 안넣어도 순서대로 파라미터 출력
    func combine(_ string1: String, _ string2: String) -> String {
        return "\(string1) \(string2)"
    }
    func combine(_ int1: Int, _ int2: Int) -> Int {
        return int1 + int2
    }
    
    func combine(_ int1: Int, _ string1: String) -> String{
        return "\(int1) \(string1)"
    }
    
    let combineStruing = combine("Hello", "World")
    print(combineStruing)
    
    let combineInt = combine(1,2)
    print(combineInt)
    
    let combineMix = combine(1,"하이")
    print(combineMix)
    
}
