//
//  OrderDetailViewModelTests.swift
//  AlbertosTests
//
//  Created by NO SEONGGYEONG on 4/18/25.
//
@testable import Albertos
import XCTest

final class OrderDetailViewModelTests: XCTestCase {
    
    func testWhenCheckoutButtonTappedStartsPaymentProcessingFlow() {
        // OrderController 를 생성하고 일부 항목을 추가합니다.
        let orderController = MockOrderController()
        orderController.addToOrder(.fixture(name: "name"))
        orderController.addToOrder(.fixture(name: "other name"))
        // 스파이를 생성합니다.
        let paymentProcessingSpy = PaymentProcessingSpy()
        let viewModel = OrderDetail.viewModel(orderController: orderController, paymentProcesser: paymentProcessingSpy)
        viewModel.checkout()
        XCTAssertEqual(paymentProcessingSpy.receivedOrder, orderController.order)
    }
    
}
