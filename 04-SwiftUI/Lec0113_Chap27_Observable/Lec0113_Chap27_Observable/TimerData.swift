//
//  TimerData.swift
//  Lec0113_Chap27_Observable
//
//  Created by SG on 1/13/25.
//

import Foundation
// 데이터 관찰
import Combine

//  최신 SwiftUI 에서는 @Observable로 데이터 스트림 처리가 가능
 @Observable
class TimerData: ObservableObject {
//    @Published 는 @Observable 에서 사라짐 (알아서 관리해줌) 
    var timeCount = 0
    var timer: Timer?
    
    init() {
        
        //        기존 셀렉터 호출 방식: #selector 필요
        //        timer = Timer.scheduledTimer(withTimeInterval: 1.0,
        //                                     target: self,
        //                                     selector: #selector(timerDidFire),
        //                                     userInfo: nil ,
        //                                     repeats: true)
        
        
        // [weak self]는 변수 캡쳐시 ARC 카운트가 증가하지 않도록 해서, 메모리 누수를 막는다.
        // [unowned self]는 강제 언래핑된 self 키워드, 조심해서 사용해야함. 대신 성능이 좋음.
        // 자기 자신을 참조함으로 순환 참조 오류의 위험이 있어서 그냥 self는 사용이 안됨.
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [unowned self] _ in
            self.timerDidFire()
        }
    }
    
    
    // 타이머 클로저가 TimerData 인스턴스 메모리 해제 이후에 동작하지 않도록 invalidate 함수를 실행함.
    //    (unowned 사용을 위한 예시)
    // 소멸자. 프로퍼티는 swift가 알아서 해제해주는데 구조화된 객체, 쓰레드 분류... 는 소멸자로 일일히 해제 해주어야함.
    deinit {
        timer?.invalidate()
    }
    
    /*@objc  */func timerDidFire() {
        timeCount += 1
    }
    func resetCount() {
        timeCount = 0
    }
    
}
