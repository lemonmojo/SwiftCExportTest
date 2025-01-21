import XCTest

@testable import SwiftCExportTest

final class SwiftTests: XCTestCase {
    func testAddition() throws {
        let math = Math(operation: .addition)
        
        let number1: Int64 = 5
        let number2: Int64 = 10
        let expectedResult = number1 + number2
        
        let result = math.execute(number1: number1,
                                  number2: number2)
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func testSubtraction() throws {
        let math = Math(operation: .subtraction)
        
        let number1: Int64 = 5
        let number2: Int64 = 10
        let expectedResult = number1 - number2
        
        let result = math.execute(number1: number1,
                                  number2: number2)
        
        XCTAssertEqual(result, expectedResult)
    }
}
