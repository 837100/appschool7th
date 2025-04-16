//
//  MenuFetchingPlaceholder.swift
//  Albertos
//
//  Created by NO SEONGGYEONG on 4/16/25.
//

import Foundation
import Combine

class MenuFetchingPlaceholder: MenuFetching {
    func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
//        return Future { $0(.success(menu))}
        return Future { $0(.failure(NSError(domain: "Error", code: 0, userInfo: nil))) }
            .delay(for: 0.5, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
