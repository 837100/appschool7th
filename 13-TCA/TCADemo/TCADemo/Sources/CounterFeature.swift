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
        var isLoading = false
        var fact: String? = nil
    }
    
    enum Action {
        case incrementButtonTapped
        case decrementButtonTapped
        case factButtonTapped
        case factResponse(Result<String, Error>)
    }
    
    @Dependency(\.continuousClock) var clock
    @Dependency(\.numberFact) var numberFact
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case.incrementButtonTapped:
                state.count += 1
                state.fact = nil
                return.none
                
            case.decrementButtonTapped:
                state.count -= 1
                state.fact = nil
                return .none
                
            case.factButtonTapped:
                state.isLoading = true
                state.fact = nil
                return.run { [count = state.count] send in
                    let fact = try await self.numberFact.fetch(count)
                    await send(.factResponse(.success(fact)))
                } catch : { error, send in
                    await send(.factResponse(.failure(error)))
                }
                
            case let.factResponse(.success(fact)):
                state.isLoading = false
                state.fact = fact
                return .none
                
            case.factResponse(.failure):
                state.isLoading = false
                return.none
            }
        }
    }
}
