import XCTest
@testable import EchoClient

class EchoClientTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(EchoClient().text, "Hello, World!")
    }


    static var allTests : [(String, (EchoClientTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
