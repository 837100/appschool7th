//
//  CounterFeature.swift
//  TCADemo
//
//  Created by NO SEONGGYEONG on 4/24/25.
//

import ComposableArchitecture

@Reducer
struct CounterFeature {
    @ObservableState
    struct State: Equatable {
        var count = 0
        
    }
    
    enum Action {
        case incrementButtonTapped
        case decrementButtonTapped
        
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case.incrementButtonTapped:
                state.count += 1
                return.none
                
            case.decrementButtonTapped:
                state.count -= 1
                return .none
                
            }
        }
    }
}
