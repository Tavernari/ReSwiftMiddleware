//
//  LogConsole.swift
//  ReSwiftMiddlewareTests
//
//  Created by Victor Carvalho Tavernari on 01/12/18.
//  Copyright © 2018 Tavernapps Mobile. All rights reserved.
//

import Foundation

class LogConsole {
    var log = "";
    
    func register(value:String){
        self.log += "\n\(value)"
        NSLog(value)
    }
}
