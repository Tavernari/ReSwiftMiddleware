//
//  CounterActions.swift
//  ReSwiftMiddlewareTests
//
//  Created by Victor Carvalho Tavernari on 01/12/18.
//  Copyright © 2018 Tavernapps Mobile. All rights reserved.
//

import Foundation
import ReSwift

enum CounterActions : Action{
    case increment(Int)
    case decrement(Int)
}
