//
//  ViewController.swift
//  RxSwiftDemo
//
//  Created by NO SEONGGYEONG on 4/22/25.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    let simpleObservable = Observable.just("Hello, RxSwift")
    let arrayObservable = Observable.from(["Apple", "Banana", "Orange"])
    let rangeObservable = Observable.range(start: 1, count: 3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "RxSwift Demo"
        
        print("--- simpleObservable 구독 ---")
        simpleObservable
            .subscribe(onNext: { value in
                print("Received value: \(value)")
            }, onError: {error in
                print("Error: \(error)")
            }, onCompleted: {
                print("Completed")
            }, onDisposed: {
                print("Disposed1!")
            })
            .disposed(by: disposeBag)
        
        print("\n--- arrayObservable 구독 ---")
        arrayObservable
            .subscribe(onNext: { fruit in
                print("Fruit: \(fruit)")
            }, onCompleted: {
                print("Fruit stream Completed")
            }, onDisposed: {
                print("DisPose2!")
            })
            .disposed(by: disposeBag)
        
        print("\n--- rangeObservable 구독---")
        let subscription = rangeObservable
            .subscribe(onNext: {number in
                print("Number: \(number)")
            }, onDisposed: {
                print("Dispose3!")
            })
        subscription.dispose()
    }
    
    
    
}
