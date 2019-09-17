import XCTest
//@testable import Int

class PrimeTests: XCTestCase {
  static var allTests = {
    return [
      ("testOutput", testOutput)
    ]   
  }()

  func testOutput() {
    XCTAssertEqual([2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97], getPrimes(from: 0, to: 100))
  }

}


