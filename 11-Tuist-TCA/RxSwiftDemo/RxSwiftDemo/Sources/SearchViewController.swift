//
//  SearchViewController.swift
//  RxSwiftDemo
//
//  Created by NO SEONGGYEONG on 4/23/25.
//

import UIKit
import RxSwift
import RxCocoa

class SearchViewController: UIViewController {
    
    // UI 요소들
    let searchBar = UISearchBar()
    let tableView = UITableView()
    let button = UIButton(type: .system)
    
    
    private let disposeBag = DisposeBag()
    private let viewModel: ViewModel = ViewModel(apiClient: APIClient()) // ViewModel 인스턴스
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }
    
    func setupUI() {
        title = "Search View Controller"
        view.backgroundColor = .white
        
        // Search Bar 설정
        searchBar.placeholder = "Search..."
        navigationItem.titleView = searchBar
        
        // TableView 설정
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // 버튼 설정
        button.setTitle("Search", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        button.rx.tap.asSignal(onErrorSignalWith: .empty())
            .emit(onNext: { [weak self] in
                guard let self = self else {return}
                print("Search button tapped")
                if let query = self.searchBar.text, !query.isEmpty {
                    self.viewModel.searchText.onNext(query)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func bindViewModel() {
        searchBar.rx.text.orEmpty
            .bind(to: viewModel.searchText)
            .disposed(by: disposeBag)
        
        viewModel.searchResults
            .drive(tableView.rx.items(cellIdentifier: "cell")) { index, result, cell in
                cell.textLabel?.text = result
            }
            .disposed(by: disposeBag)
    }
}


extension SearchViewController {
    class ViewModel {
        var searchText = PublishSubject<String>()
        
        var searchResults: Driver<[String]>
        
        init(apiClient: APIClient) {
            searchResults = searchText
                .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
                .distinctUntilChanged()
                .flatMapLatest { query -> Observable<[String]> in
                    if query.isEmpty {
                        return Observable.just([]) // 빈 검색이면 빈 결과
                    }
                    return apiClient.search(query: query)
                        .catchAndReturn([]) // 에러 발생 시 빈 배열 반환
                }
                .asDriver(onErrorJustReturn: [])
        }
    }
}

struct APIClient {
    func search(query: String) -> Observable<[String]> {
        return Observable.create { observer in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                let results = ["Result 1", "Result 2", "Result 3"]
                observer.onNext(results)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
}

#Preview {
    UINavigationController(rootViewController: SearchViewController())
}
