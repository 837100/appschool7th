//
//  MenuGroupingTests.swift
//  AlbertosTests
//
//  Created by NO SEONGGYEONG on 4/15/25.
//

import XCTest

@testable import Albertos

final class MenuGroupingTests: XCTestCase {
    
    // 한 카테고리당 섹션이 하나씩 있어야 한다.
    func testMenuWithManyCategoriesReturnsOneSectionPerCategory() {
        let menu = [
            MenuItem.fixture(category: "pastas", name: "pizzascholl", spicy: false),
            MenuItem.fixture(category: "pastas", name: "domino", spicy: true),
            MenuItem.fixture(category: "drink", name: "cola" , spicy: false),
            MenuItem.fixture(category: "desserts", name: "cake", spicy: false),
        ]
//            .shuffled()
        
        let sections = groupMenuByCategory(menu)
        XCTAssertEqual(sections.count, 3)
        
        XCTAssertEqual(try XCTUnwrap(sections[safe: 0]?.category), "pastas")
        XCTAssertEqual(try XCTUnwrap(sections[safe: 0]?.items.first?.name), "pizzascholl")
        XCTAssertEqual(try XCTUnwrap(sections[safe: 0]?.items.last?.name), "domino")
//        XCTAssertEqual(try XCTUnwrap(sections[safe: 0]?.items.last?.name), "pizzascholl")
//        XCTAssertEqual(try XCTUnwrap(sections[safe: 0]?.items.first?.name), "domino")
        XCTAssertEqual(try XCTUnwrap(sections[safe: 1]?.category), "drink")
        XCTAssertEqual(try XCTUnwrap(sections[safe: 2]?.category), "desserts")
        
    }
    
    // 카테고리가 하나인 경우 섹션도 하나여야 한다.
    func testMenuWithOneCategoryReturnsOneSection() {
        // Arragne : 카테고리가 하나인 메뉴
        let menu = [
            MenuItem.fixture(category: "pastas", name: "name"),
            MenuItem.fixture(category: "pastas", name: "other name"),
        ]
        
        // Act
        let sections = groupMenuByCategory(menu)
        
        // Assert
        
        // 둘이 같은 동작을 하는 코드이지만 뭐가 선호될까? Equal 을 사용하면 expect와 result를 비교하는 것처럼 보인다.
        //        XCTAssertTrue(sections.count == 1)
        // 조금 더 명확한 테스트 결과를 제공함.
        XCTAssertEqual(sections.count, 1)
        
        
        // Assert & Act
        do {
            let section = try XCTUnwrap(sections.first)
            
            // Assert
            XCTAssertEqual(section.items.count, 2)
            XCTAssertEqual(section.items.first?.name, "name")
            XCTAssertEqual(section.items.last?.name, "other name")
        } catch {
            XCTFail("Failed to unwrap section: \(error)")
        }
    }
    
    
    // 메뉴가 비어있으면 섹션도 비어있어야 한다.
    func testEmptyMenuReturnsNoSections() {
        // Arrange: 빈 메뉴
        let menu = [MenuItem]()
        
        // Act
        let sections = groupMenuByCategory(menu)
        
        // Assert
        XCTAssertTrue(sections.isEmpty)
    }
}
