//
//  MenuFetchingSpy.swift
//  AlbertosTests
//
//  Created by NO SEONGGYEONG on 4/17/25.
//
@testable import Albertos
import Combine

final class MenuFetchingSpy: MenuFetching {
    let fetchingClosure: () -> AnyPublisher<[MenuItem], Error>
    
    init(fetchingClosure: @escaping () -> AnyPublisher<[MenuItem], Error>) {
        self.fetchingClosure = fetchingClosure
    }
    
    func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
        return fetchingClosure()
    }
}
