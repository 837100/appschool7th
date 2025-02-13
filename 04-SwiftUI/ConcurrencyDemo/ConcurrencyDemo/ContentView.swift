//
//  ContentView.swift
//  ConcurrencyDemo
//
//  Created by SEONGGYEONG NO on 1/10/25.
//

import SwiftUI

enum DurationError: Error {
    case tooLong
    case tooShort
}

struct ContentView: View {
    var body: some View {
        Button(action: {
            Task(priority: .high){
                Button(action: {
                    //작업의 우선순위를 결정할 수 있다.
                    Task(priority: .high) {
                        // 작업의 우선순위를 확인하는 프로퍼티
                        _ = Task.currentPriority
                        // 작업의 취소 여부를 확인하는 프로퍼티
                        _ = Task.isCancelled
                        await Task.yield()
                        await doSomething()
                        
                    }
                    let detachedTask = Task.detached{
                        await doSomething()
                    }
                    if(!detachedTask.isCancelled) {
                        // 작업 취소
                        detachedTask.cancel()
                    }
                }){
                    Text("Do Something")
                }
                await doSomething()
            }
            
        }) {
            Text("Do Something")
        }
        
    }
    func doSomething() async {
        print("Start \(Date())")
        
        async let result = takesTooLong()
        print("After async-let \(Date())")
        // async let 상수를 사용하려면, await
        print("result = \(await result)")
        print("End \(await result)")
    }
    
    func takesTooLong() async -> Date {
        sleep(5)
        return Date()
    }
}

#Preview {
    ContentView()
}
