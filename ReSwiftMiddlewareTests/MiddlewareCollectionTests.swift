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

    override func setUp() {
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUsingMiddlewareLoggerAfterSendActionShouldRegisterLog() {
        
        let logger = LogConsole()
        let expectedLogger = LogConsole()
        expectedLogger.register(value: CounterActions.increment(1).toString())
        
        let state = CounterState();
        let middlewaresCollection = MiddlewaresCollection<CounterState>();
        
        let middlewareLogger = MiddlewareLogger(logger: logger);
        
        middlewaresCollection.add(middlewareLogger);
        
        let store = Store<CounterState>(reducer: reducerCounterState, state: CounterState(), middleware: middlewaresCollection.middlewares)
        
        store.dispatch(CounterActions.increment(1))
        
    
        XCTAssertEqual(logger.log, expectedLogger.log);
    }
    
    func testUsingMiddlewareLoggerAfterSendManyActionShouldRegisterLog() {
        
        let logger = LogConsole()
        let expectedLogger = LogConsole()
        expectedLogger.register(value: CounterActions.increment(1).toString())
        expectedLogger.register(value: CounterActions.increment(3).toString())
        expectedLogger.register(value: CounterActions.decrement(4).toString())
        
        let state = CounterState();
        let middlewaresCollection = MiddlewaresCollection<CounterState>();
        
        let middlewareLogger = MiddlewareLogger(logger: logger);
        
        middlewaresCollection.add(middlewareLogger);
        
        let store = Store<CounterState>(reducer: reducerCounterState, state: CounterState(), middleware: middlewaresCollection.middlewares)
        
        store.dispatch(CounterActions.increment(1))
        store.dispatch(CounterActions.increment(3))
        store.dispatch(CounterActions.decrement(4))
        
        
        XCTAssertEqual(logger.log, expectedLogger.log);
    }
}
