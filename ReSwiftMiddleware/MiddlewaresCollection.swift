//
//  MiddlewareCollection.swift
//  ReSwiftMiddleware
//
//  Created by Victor Carvalho Tavernari on 01/12/18.
//  Copyright © 2018 Tavernapps Mobile. All rights reserved.
//

import ReSwift

open class MiddlewaresCollection<T: StateType>{
    public private(set) var middlewares: [Middleware<T>]

    public init() {
        self.middlewares = []
    }
    
    public func concact(withCollection collection: MiddlewaresCollection) -> MiddlewaresCollection {
        self.middlewares.append(contentsOf: collection.middlewares)
        return self
    }
    
    public func add(_ middlewareItems: MiddlewareExecutor...) -> MiddlewaresCollection {
        for item in middlewareItems {
            self.middlewares.append { (dispatch, state) -> (@escaping DispatchFunction) -> DispatchFunction in
                return { next in
                    return { action in
                        if let nextAction = item.execute(action: action, getState: state, dispatch: dispatch) {
                            next(nextAction)
                        }
                    }
                }
            }
        }
        
        return self
    }
}
