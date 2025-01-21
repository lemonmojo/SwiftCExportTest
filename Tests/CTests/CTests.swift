import XCTest

@testable import CDefinitions

final class CTests: XCTestCase {
    func testAddition() throws {
        let math = math_create(MATH_OPERATION_ADDITION)
        
        defer {
            math_destroy(math)
        }
        
        let number1: Int64 = 5
        let number2: Int64 = 10
        let expectedResult = number1 + number2
        
        let result = math_execute(math,
                                  number1,
                                  number2)
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func testSubtraction() throws {
        let math = math_create(MATH_OPERATION_SUBTRACTION)
        
        defer {
            math_destroy(math)
        }
        
        let number1: Int64 = 5
        let number2: Int64 = 10
        let expectedResult = number1 - number2
        
        let result = math_execute(math,
                                  number1,
                                  number2)
        
        XCTAssertEqual(result, expectedResult)
    }
}
