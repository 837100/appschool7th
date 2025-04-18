//
//  ContentView.swift
//  Albertos
//
//  Created by NO SEONGGYEONG on 4/15/25.
//

import SwiftUI
import Combine
import HippoAnalytics

struct MenuList: View {
    @EnvironmentObject var orderController: OrderController
    @StateObject var  viewModel: ViewModel
    
    var body: some View {
        List {
            switch viewModel.sections {
            case .success(let sections):
                ForEach(sections) { section in
                    Section(header: Text(section.category)) {
                        ForEach(section.items) { item in
                            NavigationLink(destination: destination(from: item)) {
                                MenuRow(viewModel: .init(item: item))
                            }
                        }
                    }
                }
            case .failure(let error):
                Text("An error occurred:")
                Text(error.localizedDescription).italic()
                Button("Retry") {
                    viewModel.retry()
                }
                .padding()
                .background(Color.blue)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .refreshable {
            viewModel.retry()
        }
        .navigationTitle("Alberto's 🇮🇹")
    }
    
    func destination(from item: MenuItem) -> some View {
        MenuItemDetail(viewModel: .init(item: item, orderController: orderController))
    }
}

extension MenuList {
    class ViewModel: ObservableObject {
        @Published private(set) var sections: Result<[MenuSection], Error> = .success([])
        
        private let menuFetching: MenuFetching
        private let menuGrouping: ([MenuItem]) -> [MenuSection]
        
        var cancellables = Set<AnyCancellable>()
        
        init(
            menuFetching: MenuFetching,
            menuGrouping: @escaping ([MenuItem]) -> [MenuSection] = groupMenuByCategory) {
                HippoAnalytics.shared.logEvent(named: "menuListOpened", properties: ["menuListOpened" : "Menu List Opened"])
                self.menuFetching = menuFetching
                self.menuGrouping = menuGrouping
                fetchMenu()
            }
        
        func fetchMenu() {
            menuFetching
                .fetchMenu()
            // [중요] 전달 받은 [MenuItem] 시퀀스를 menuGrouping 함수에 전달하도록 수정
                .map(menuGrouping)
            // [중요] Result<[MenuSection], Error> 타입으로 변환
                .receive(on: DispatchQueue.main)
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
        
        func retry() {
            fetchMenu()
        }
    }
}


#Preview {
    NavigationStack {
        MenuList(viewModel: .init(menuFetching: MenuFetchingPlaceholder()))
        
    }
}
