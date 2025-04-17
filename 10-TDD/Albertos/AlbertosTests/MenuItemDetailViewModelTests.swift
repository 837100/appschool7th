//
//  MenuItemDetailViewModelTests.swift
//  AlbertosTests
//
//  Created by NO SEONGGYEONG on 4/17/25.
//
@testable import Albertos
import XCTest

// 메뉴 상세 페이지의 뷰 모델 상태 값을 테스트 합니다.
final class MenuItemDetailViewModelTests: XCTestCase {
    
    // 메뉴가 추가되어 있을 때, 주문 버튼은 주문 삭제를 표시해야 합니다.
    func testWhenItemInOrderButtonSaysRemove() {
        // Arrange
        let item = MenuItem.fixture()
        let orderController = OrderController()
        let viewModel = MenuItemDetail.ViewModel(item: item, orderController: orderController)
        let text = viewModel.orderButtonText
        
        // ACT
        orderController.addToOrder(item: item)
        
        // Assert
        XCTAssertEqual(text, "주문 삭제")
    }
    func testWhenItemNotInOrderButtonSaysAdd() {}
    
}
