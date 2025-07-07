#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

public class Math {
    public enum Operation {
        case addition
        case subtraction
    }
    
    public let operation: Operation
    
    public init(operation: Operation) {
        self.operation = operation
    }
    
    deinit {
        print("[DEBUG] Deinitializing Math instance")
    }
    
    public func execute(number1: Int64,
                        number2: Int64) -> Int64 {
        let result: Int64
        
        switch operation {
            case .addition:
                result = number1 + number2
            case .subtraction:
                result = number1 - number2
        }
        
        return result
    }
}
