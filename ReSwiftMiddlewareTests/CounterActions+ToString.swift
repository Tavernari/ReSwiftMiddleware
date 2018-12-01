//
//  CounterActions+ToString.swift
//  ReSwiftMiddlewareTests
//
//  Created by Victor Carvalho Tavernari on 01/12/18.
//  Copyright © 2018 Tavernapps Mobile. All rights reserved.
//

import Foundation

extension CounterActions {
    func toString()->String{
        switch self {
        case .increment(let value):
            return "[Increment \(value)]"
        case .decrement(let value):
            return "[Decrement \(value)]"
        }
    }
}
