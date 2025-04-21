//
//  OrderDetailViewModelTests.swift
//  AlbertosTests
//
//  Created by NO SEONGGYEONG on 4/18/25.
//
@testable import Albertos
import XCTest
import HippoPayments

final class OrderDetailViewModelTests: XCTestCase {
    
    func testWhenCheckoutButtonTappedStartsPaymentProcessingFlow() {
        // OrderController 를 생성하고 일부 항목을 추가합니다.
        let orderController = MockOrderController()
        orderController.addToOrder(.fixture(name: "name"))
        orderController.addToOrder(.fixture(name: "other name"))
        // 스파이를 생성합니다.
        let paymentProcessingSpy = PaymentProcessingSpy()
        let viewModel = OrderDetail.ViewModel(orderController: orderController, paymentProcessor: paymentProcessingSpy)
        viewModel.checkout()
        XCTAssertEqual(paymentProcessingSpy.receivedOrder, orderController.order)
    }
    
    func testWhenPaymentFailsUpdatesPropertyToShowErrorAlert() {
        let viewModel = OrderDetail.ViewModel(orderController: OrderController(), paymentProcessor: PaymentProcessingStub(returning: .failure(HippoPaymentsError.genericError)))
        let predicate = NSPredicate {_, _ in viewModel.alertToShow != nil}
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: .none)
        viewModel.checkout()
    }
    
}
