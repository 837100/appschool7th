//
//  Publisher+retry.swift
//  CombineDemo
//
//  Created by NO SEONGGYEONG on 4/8/25.
//

import Foundation
import Combine

// where 조건이 참 일때만 동작하는 extension (Failure가 Error 타입일 떄 만 동작함)
extension Publisher where Failure == Error {
    func retry() -> AnyPublisher<Output, Failure> {
        self
            .catch { error  in
                if case APIError.serverError(_, _, let retryAfter) = error {
                    let delayTime = retryAfter > 0 ? TimeInterval(retryAfter) : 0.1
                    return Just(())
                        .delay(for: .seconds(delayTime), scheduler: RunLoop.main)
                        .flatMap { _ in
                            return self
                        }
                        .retry(10)
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: error).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
