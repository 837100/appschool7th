//
//  FizzBuzzTests.swift
//  FizzBuzzTests
//
//  Created by NO SEONGGYEONG on 4/14/25.
//

import XCTest


final class FizzBuzzTests: XCTestCase {
    
    override class func setUp() {
        print("setUp")
    }
    
    override func tearDown() {
        print("tearDown")
    }
    
    // 제일 처음에 실행되는 함수
    override func setUpWithError() throws {
        print("setUpWithError")
    }
    
    // 제일 마지막에 실행되는 함수
    override func tearDownWithError() throws {
        print("tearDownWithError")
    }
    
    func testFizzBuzzDivisibleBy3() {
        let result = fizzBuzz(3)
        XCTAssertEqual(result, "fizz")
    }
    func testFizzBuzzDivisibleBy5() {
        let result = fizzBuzz(5)
        XCTAssertEqual(result, "buzz")
    }
    func testFizzBuzzDivisibleBy15() {
        let result = fizzBuzz(15)
        XCTAssertEqual(result, "fizzbuzz")
    }
    
}
