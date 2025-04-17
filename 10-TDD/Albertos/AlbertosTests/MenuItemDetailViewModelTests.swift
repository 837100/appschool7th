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
//        let text = viewModel.orderButtonText
        
        // Act
//        XCTAssertEqual(viewModel.orderButtonText, "주문 삭제")
        orderController.addToOrder(item)
        
        // Assert
        XCTAssertEqual(viewModel.orderButtonText, "주문 삭제")
    }
    
    func testWhenItemNotInOrderButtonSaysAdd() {
        //  Arrange
        let item = MenuItem.fixture()
        let orderController = OrderController()
        let viewModel = MenuItemDetail.ViewModel(item: item, orderController: orderController)
        
        // Assert
        XCTAssertEqual(viewModel.orderButtonText, "주문 추가")
    }
    
    
    // 메뉴가 장바구니에 담겨 있으면, 주문 버튼을 누르면 장바구니에서 삭제됩니다.
    func testWhenItemIsInOrderButtonActionRemovesIt() {
        // Arrange
        let item = MenuItem.fixture()
        let orderController = OrderController()
        let viewModel = MenuItemDetail.ViewModel(item: item, orderController: orderController)
        
        // Act
        orderController.addToOrder(item)
        viewModel.addOrRemoveFromOrder()
        
        // Assert
        XCTAssertFalse(orderController.order.items.contains {
            $0 == item })
    }
    
    // 메뉴가 장바구니에 담겨 있지 않으면, 주문 버튼을 누르면 장바구니에 추가됩니다.
    func testWhenItemIsNotInOrderButtonActionAddsIt() {
        // Arrange
        let item = MenuItem.fixture()
        let orderController = OrderController()
        let viewModel = MenuItemDetail.ViewModel(item: item, orderController: orderController)
        
        // ACT
        viewModel.addOrRemoveFromOrder()
        
        // Assert
        XCTAssertTrue(orderController.order.items.contains{
            $0 == item
        })
    }
}
