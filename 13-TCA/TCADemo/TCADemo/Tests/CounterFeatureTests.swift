//
//  CounterFeatureTests.swift
//  TCADemo
//
//  Created by NO SEONGGYEONG on 4/24/25.
//

@testable import TCADemo

import ComposableArchitecture
import Testing

@MainActor
struct CounterFeatureTests {
    @Test
    func basics() async {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        }
        
        await store.send(.incrementButtonTapped) { state in
            state.count = 1
        }
        
        await store.send(.decrementButtonTapped) {state in
            state.count = 0
        }
    }
}
