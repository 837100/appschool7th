//
//  Schduler.swift
//  SchedulerDemo
//
//  Created by NO SEONGGYEONG on 4/10/25.
//

import Combine

public protocol Scheduler {
    associatedtype SchedulerTimeType: Strideable where
    Self.SchedulerTimeType.Stride : SchedulerTimeIntervalConvertible
    
    associatedtype SchedulerOptions
    
    var now: Self.SchedulerTimeType { get }
    
    var minimumTolerance: Self.SchedulerTimeType.Stride { get }
    
    func schedule(options: Self.SchedulerOptions?,
                  _ action: @escaping () -> Void)
    
    func schedule(after date: Self.SchedulerTimeType,
                  tolerance: Self.SchedulerTimeType.Stride,
                  opotions: Self.SchedulerOptions?,
                  _ action: @escaping () -> Void)
    
    func schedule(after date: Self.SchedulerTimeType,
                  interval: Self.SchedulerTimeType.Stride,
                  tolerance: Self.SchedulerTimeType.Stride,
                  options: Self.SchedulerOptions?,
                  _ action: @escaping () -> Void)
    
}
