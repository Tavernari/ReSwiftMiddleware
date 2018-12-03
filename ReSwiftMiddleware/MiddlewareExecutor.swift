//
//  Middleware.swift
//  ReSwiftMiddleware
//
//  Created by Victor Carvalho Tavernari on 01/12/18.
//  Copyright © 2018 Tavernapps Mobile. All rights reserved.
//

import Foundation
import ReSwift

public typealias GetStateFunction = ()->StateType?

public protocol MiddlewareExecutor{
    func execute(action:Action, getState:@escaping GetStateFunction , dispatch: @escaping DispatchFunction) -> Action?
}

