//
//  MiddlewareCollection.swift
//  ReSwiftMiddleware
//
//  Created by Victor Carvalho Tavernari on 01/12/18.
//  Copyright © 2018 Tavernapps Mobile. All rights reserved.
//

import Foundation
import ReSwift

class MiddlewaresCollection<T:StateType>{
    private var _middlewares:[Middleware<T>];
    init(){
        self._middlewares = [];
    }
    
    func concact(withCollection:MiddlewaresCollection)->MiddlewaresCollection{
        self._middlewares = _middlewares + withCollection.middlewares;
        return self;
    }
    
    func add(_ middlewareItens:MiddlewareExecutor...)->MiddlewaresCollection{
        for item in middlewareItens {
            self._middlewares.append ({ (dispatch, state) -> (@escaping DispatchFunction) -> DispatchFunction in
                return { next in
                    return { action in
                        if let nextAction = item.execute(action: action, state: state()){
                            next(nextAction);
                        }
                    }
                }
            });
        }
        
        return self;
    }
    
    public var middlewares:[Middleware<T>]{
        return self._middlewares;
    }
}
