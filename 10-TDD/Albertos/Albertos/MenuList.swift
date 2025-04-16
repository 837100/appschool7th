//
//  ContentView.swift
//  Albertos
//
//  Created by NO SEONGGYEONG on 4/15/25.
//

import SwiftUI
import Combine

struct MenuList: View {
    @StateObject var  viewModel: ViewModel
    
    var body: some View {
        List {
            switch viewModel.sections {
            case .success(let sections):
                ForEach(sections) { section in
                    Section(header: Text(section.category)) {
                        ForEach(section.items) { item in
                            MenuRow(viewModel: .init(item: item))
                        }
                    }
                }
            case .failure(let error):
                Text("An error occurred:")
                Text(error.localizedDescription).italic()
            }
        }
        .navigationTitle("Alberto's 🇮🇹")
    }
}

extension MenuList {
    class ViewModel: ObservableObject {
        @Published private(set) var sections: Result<[MenuSection], Error> = .success([])
        
        var cancellables = Set<AnyCancellable>()
        
        init(
            menuFetching: MenuFetching,
            menuGrouping: @escaping ([MenuItem]) -> [MenuSection] = groupMenuByCategory) {
                
                menuFetching.fetchMenu()
                // [중요] 전달 받은 [MenuItem] 시퀀스를 menuGrouping 함수에 전달하도록 수정
                    .map(menuGrouping)
                // [중요] Result<[MenuSection], Error> 타입으로 변환
                    .sink(receiveCompletion: { [weak self] completion in
                        if case .failure(let error) = completion {
                            self?.sections = .failure(error)
                        }
                    },
                          receiveValue: { [weak self] value in
                        self?.sections = .success(value)
                    })
                    .store(in: &cancellables)
            }
    }
}

#Preview {
    NavigationStack {
        MenuList(viewModel: .init(menuFetching: MenuFetchingPlaceholder()))
        
    }
}
