//
//  MenuFetching.swift
//  Albertos
//
//  Created by NO SEONGGYEONG on 4/16/25.
//

import Combine

protocol MenuFetching {
    func fetchMenu() -> AnyPublisher<[MenuItem], Error>
}
