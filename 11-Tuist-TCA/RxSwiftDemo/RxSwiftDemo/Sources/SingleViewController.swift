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
        // Single 예제
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
        
        // Completable 예제 설명
        saveDataToServer()
            .subscribe(onCompleted: {
                print("Data saved successfully!")
            }, onError: { error in
                print("Error occurred while saving data: \(error)")
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
    
    func saveDataToServer() -> Completable {
        return Completable.create { completable in
            print("Completable: 서버에 데이터 저장 중...")
            DispatchQueue.global().asyncAfter(deadline: .now() + 1){
                let success = Bool.random()
                if success {
                    completable(.completed)
                } else {
                    completable(.error(MyError.operationFailed))
                }
            }
            return Disposables.create()
        }
    }
    
    // --- Maybe 예제 ---
    func findDataInCache() -> Maybe<String> {
        return Maybe<String>.create { maybe in
            print("Maybe 캐시에서 데이터 찾는 중...")
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
                let cacheHit = Bool.random()
                let hasData = Bool.random()
                
                if cacheHit && hasData {
                    maybe(.success("캐시 데이터 찾음"))
                } else if cacheHit && !hasData {
                    maybe(.completed)
                } else {
                    maybe(.error(MyError.noDataFound))
                }
            }
            return Disposables.create()
        }
    }
}

