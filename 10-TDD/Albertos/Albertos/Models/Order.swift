//
//  Order.swift
//  Albertos
//
//  Created by NO SEONGGYEONG on 4/17/25.
//

import Foundation

struct Order: Equatable {
    var items: [MenuItem]
    var total: Double {
        items.reduce(0) { $0 + $1.price }
    }
}

extension Order {
    var hippoPaymentsPayload: [String: Any] { [:] }
}
