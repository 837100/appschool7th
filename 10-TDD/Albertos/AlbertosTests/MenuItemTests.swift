//
//  MenuItemTests.swift
//  AlbertosTests
//
//  Created by NO SEONGGYEONG on 4/17/25.
//
@testable import Albertos
import XCTest

final class MenuItemTests: XCTestCase {
    // 문자열이 깨져있으면 에러를 배출하므로 throws
    // 모든 입력 프로퍼티를 거진 JSON 데이터를 디코딩
    func testWhenDecodedFromJsonDataHasAllTheInputProperties() throws {
        let json = #"{ "name": "a name", "category": "a category", "spicy" : true , "price" : 0.0 }"#
        let data = try XCTUnwrap(json.data(using: .utf8))
        let item = try JSONDecoder().decode(MenuItem.self, from: data)
        XCTAssertEqual(item.name, "a name")
        XCTAssertEqual(item.category, "a category")
        XCTAssertEqual(item.spicy, true)
    }
    
    func testDecodeFromJsonData() throws {
        let url = try XCTUnwrap(
            Bundle(for: type(of: self)).url(forResource: "menu_item", withExtension: "json")
        )
        let data = try Data(contentsOf: url)
        let item = try JSONDecoder().decode(MenuItem.self, from: data)
        XCTAssertEqual(item.name, "a name")
        XCTAssertEqual(item.category, "a category")
        XCTAssertEqual(item.spicy, false)
        XCTAssertEqual(item.price, 0.0)
        
        
    }
}
