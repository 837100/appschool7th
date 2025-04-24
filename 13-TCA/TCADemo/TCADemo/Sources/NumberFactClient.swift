//
//  NumberFactClient.swift
//  TCADemo
//
//  Created by NO SEONGGYEONG on 4/24/25.
//

import Foundation
import Dependencies

struct NumberFactClient {
    var fetch: (Int) async throws -> String
}

extension NumberFactClient: DependencyKey {
    static let liveValue = Self { number in
        let (data, _) = try await URLSession.shared.data(from: URL(string: "http://numbersapi.com/\(number)/trivia")!)
        return String(decoding: data, as: UTF8.self)
    }
    static let testValue = Self { _ in "Test fact"}
    
    static let previewValue = Self { number in
        let (data, _) = try await URLSession.shared.data(from: URL(string: "http://numberapi.com/\(number)/trivia")!)
        return String(decoding: data, as: UTF8.self)
    }
}

extension DependencyValues {
    var numberFact: NumberFactClient {
        get { self[NumberFactClient.self] }
        set { self[NumberFactClient.self] = newValue }
    }
}
