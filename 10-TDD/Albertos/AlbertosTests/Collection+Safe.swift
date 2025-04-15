//
//  Collection+Safe.swift
//  AlbertosTests
//
//  Created by NO SEONGGYEONG on 4/15/25.
//

import Foundation

extension Collection {
    // 배열 타입으로 대괄호 접근을 할 수 있도록 해준다.
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
