//
//  MiddlewareLogger.swift
//  ReSwiftMiddlewareTests
//
//  Created by Victor Carvalho Tavernari on 01/12/18.
//  Copyright © 2018 Tavernapps Mobile. All rights reserved.
//

import Foundation
import ReSwift

struct MiddlewareLogger : MiddlewareExecutor{
    associatedtype T:CounterState
    
    let logger:LogConsole;
    
    init(logger:LogConsole) {
        self.logger = logger;
    }
    
    func execute<T>(action: Action, getState: @escaping () -> T?, dispatch: @escaping DispatchFunction) -> Action? where T : StateType {
        <#code#>
    }
    
    
    
//    func execute<T>(action: Action, getState: @escaping () -> T?, dispatch: @escaping DispatchFunction) -> Action? where T : StateType {
//
//        if let counterAction = action as? CounterActions{
//            self.logger.register(value: counterAction.toString())
//        }
//
//        return action
//    }
}
