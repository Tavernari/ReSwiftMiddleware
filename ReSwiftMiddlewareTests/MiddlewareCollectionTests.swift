//
//  MiddlewareCollectionTests.swift
//  ReSwiftMiddlewareTests
//
//  Created by Victor Carvalho Tavernari on 01/12/18.
//  Copyright © 2018 Tavernapps Mobile. All rights reserved.
//

import XCTest
import ReSwift

class MiddlewareCollectionTests: XCTestCase {

    func testUsingMiddlewareLoggerAfterSendActionShouldRegisterLog() {
        
        let logger = LogConsole()
        let expectedLogger = LogConsole()
        expectedLogger.register(value: CounterActions.increment(1).toString())

        let middlewaresCollection = MiddlewaresCollection<CounterState>()
        
        let middlewareLogger = MiddlewareLogger(logger: logger)
        
        _ = middlewaresCollection.add(middlewareLogger)
        
        let store = Store<CounterState>(
            reducer: reducerCounterState,
            state: CounterState(),
            middleware: middlewaresCollection.middlewares)
        
        store.dispatch(CounterActions.increment(1))

        XCTAssertEqual(logger.log, expectedLogger.log)
    }
    
    func testUsingMiddlewareLoggerAfterSendManyActionShouldRegisterLog() {
        
        let logger = LogConsole()
        let expectedLogger = LogConsole()
        expectedLogger.register(value: CounterActions.increment(1).toString())
        expectedLogger.register(value: CounterActions.increment(3).toString())
        expectedLogger.register(value: CounterActions.decrement(4).toString())

        let middlewaresCollection = MiddlewaresCollection<CounterState>()
        
        let middlewareLogger = MiddlewareLogger(logger: logger)
        
        _ = middlewaresCollection.add(middlewareLogger)
        
        let store = Store<CounterState>(
            reducer: reducerCounterState,
            state: CounterState(),
            middleware: middlewaresCollection.middlewares)
        
        store.dispatch(CounterActions.increment(1))
        store.dispatch(CounterActions.increment(3))
        store.dispatch(CounterActions.decrement(4))
        
        
        XCTAssertEqual(logger.log, expectedLogger.log)
    }
}
