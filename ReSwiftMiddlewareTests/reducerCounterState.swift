//
//  reducerCounterState.swift
//  ReSwiftMiddlewareTests
//
//  Created by Victor Carvalho Tavernari on 01/12/18.
//  Copyright © 2018 Tavernapps Mobile. All rights reserved.
//

import Foundation
import ReSwift

func reducerCounterState(action:Action, state:CounterState?) -> CounterState{
    let state = state ?? CounterState()

    guard let action = action as? CounterActions else {
        return state
    }

    switch action {
    case .increment(let value):
        return CounterState(count: state.count + value)
    case .decrement(let value):
        return CounterState(count: state.count - value)
    }
}
