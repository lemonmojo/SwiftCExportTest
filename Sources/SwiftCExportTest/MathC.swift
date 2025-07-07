// We're using FoundationEssentials instead of plain old Foundation to reduce the binary size of the library on supported platforms (ie. non-Apple platforms).
#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

// We're using `internal import` here to prevent users of the `SwiftCExportTest` module from having to also import the `CDefinitions` module.
internal import CDefinitions

// We use `@_used` to ensure our C functions are not optimized away.
// See https://github.com/swiftlang/swift/blob/main/docs/ReferenceGuides/UnderscoredAttributes.md#_used

// We use `@_cdecl` to expose the function to C with the specified name.
// See https://github.com/swiftlang/swift/blob/main/docs/ReferenceGuides/UnderscoredAttributes.md#_cdeclcname

// Swift implementation for `math_create` (declared in definitions.h).
@_cdecl("math_create")
@_used
func math_create(_ operation: MATH_OPERATION) -> math_instance_t {
    // Take the passed in C `operation` enum and convert it to the Swift equivalent.
    let swiftOperation = operation.swiftOperation
    
    // Create a new instance of the `Math` class.
    let swiftInstance = Math(operation: swiftOperation)
    
    // Get a retained pointer to the previously created `Math` class. The caller of this function now owns the instance and must eventually call `math_destroy` to free it.
    let cInstance = math_instance_t.retainedPointerFrom(swiftInstance)
    
    // Return the opaque pointer to the previously created instance of the `Math` class.
    return cInstance
}

// Swift implementation for `math_destroy` (declared in definitions.h).
@_cdecl("math_destroy")
@_used
func math_destroy(_ instance: math_instance_t) {
    // Autorelease the passed in instance of the `Math` class which eventually leads to `deinit` being called.
    instance.autorelease(Math.self)
}

// Swift implementation for `math_execute` (declared in definitions.h).
@_cdecl("math_execute")
@_used
func math_execute(_ instance: math_instance_t,
                  _ number1: Int64,
                  _ number2: Int64) -> Int64 {
    // Convert the passed in opaque pointer to an instance of the `Math` class.
    let swiftInstance: Math = instance.unretainedInstance()
    
    // Call execute and store the result.
    let result = swiftInstance.execute(number1: number1,
                                       number2: number2)
    
    // Return the result.
    return result
}

extension Math.Operation {
    // Extension for converting from the Swift enum `Math.Operation` to the C enum `MATH_OPERATION`.
    var cOperation: MATH_OPERATION {
        switch self {
            case .addition:
                MATH_OPERATION_ADDITION
            case .subtraction:
                MATH_OPERATION_SUBTRACTION
        }
    }
}

extension MATH_OPERATION {
    // Extension for converting from the C enum `MATH_OPERATION` to the Swift enum `Math.Operation`.
    var swiftOperation: Math.Operation {
        switch self {
            case MATH_OPERATION_ADDITION:
                .addition
            case MATH_OPERATION_SUBTRACTION:
                .subtraction
            default:
                fatalError("Unknown Math Operation: \(self)")
        }
    }
}
