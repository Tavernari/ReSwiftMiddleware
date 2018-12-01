# ReSwiftMiddleware
I have used the [ReSwift] Framework so when I need to implement middlewares a see it a little bit confused to use so I made this tool to help others developers to create MiddleWares.

# About
This library has two important structs `MiddlewaresCollection` and `MiddlewareExecutor`.

The `MiddlewaresCollection` is an object where you need to add yours `MiddlewareExecutor`.
The `MiddlewareExecutor` is a protocol which you use to implement to execute your middleware implementation.

# How to implement

First we need create our Middlewares.

**All this code is in the Unit Tests inside the project.**

```
import Foundation
import ReSwift

struct MiddlewareLogger : MiddlewareExecutor{
    
    let logger:LogConsole;
    
    init(logger:LogConsole) {
        self.logger = logger;
    }
    
    func execute(action: Action, state: StateType?) -> Action? {
        
        if let counterAction = action as? CounterActions{
            self.logger.register(value: counterAction.toString())
        }
    
        return action
    }
}
```

If you need to interreput the flow you just return `nil` on execute method.

The example implementing `MiddlewaresCollection`

```
let middlewaresCollection = MiddlewaresCollection<CounterState>();
let middlewareLogger = MiddlewareLogger(logger: logger);

middlewaresCollection.add(middlewareLogger);
```

Now an example how to connect this collection to [ReSwfit]

```
let store = Store<CounterState>(reducer: reducerCounterState, state: CounterState(), middleware: middlewaresCollection.middlewares)
```

# Instalation

## CocoaPods

You can install ReSwift via [CocoaPods](https://cocoapods.org/) by adding it to your `Podfile`:
```
use_frameworks!

source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

pod 'ReSwiftMiddleware'
```

And run `pod install`.

[ReSwift]: <https://github.com/ReSwift/ReSwift>
