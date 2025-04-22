//
//  SingleViewController.swift
//  RxSwiftDemo
//
//  Created by NO SEONGGYEONG on 4/22/25.
//

import UIKit
import RxSwift

enum MyError: Error {
    case operationFailed, noDataFound
}

class SingleViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromServer()
            .subscribe(onSuccess: { data in
                print("Received data: \(data)")
            }, onFailure: { error in
                print("Error occurred: \(error)")
            }, onDisposed: {
                print("Disposed!")
            })
            .disposed(by: disposeBag)
        
        
    }
    
    func fetchDataFromServer() -> Single<String> {
        return Single<String>.create { single in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2 ) {
                let success = Bool.random()
                if success {
                    single(.success("Data fetched successfully!"))
                } else {
                    single(.failure(MyError.operationFailed))
                }
                
            }
            return Disposables.create()
        }
    }
}

