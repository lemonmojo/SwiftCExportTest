#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

@_implementationOnly import CDefinitions

@_cdecl("math_create")
@_spi(CDefinitions)
@available(*, unavailable)
public func math_create(_ operation: MATH_OPERATION) -> math_instance_t {
    let swiftOperation = operation.swiftOperation
    let swiftInstance = Math(operation: swiftOperation)
    let cInstance = math_instance_t.retainedPointerFrom(swiftInstance)
    
    return cInstance
}

@_cdecl("math_destroy")
@_spi(CDefinitions)
@available(*, unavailable)
public func math_destroy(_ instance: math_instance_t) {
    instance.autorelease(Math.self)
}

@_cdecl("math_execute")
@_spi(CDefinitions)
@available(*, unavailable)
public func math_execute(_ instance: math_instance_t,
                         _ number1: Int64,
                         _ number2: Int64) -> Int64 {
    let swiftInstance: Math = instance.unretainedInstance()
    
    let result = swiftInstance.execute(number1: number1,
                                       number2: number2)
    
    return result
}
