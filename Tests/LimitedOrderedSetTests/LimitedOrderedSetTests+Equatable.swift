import XCTest
@testable import LimitedOrderedSet

final class LimitedOrderedSetEquatableTests: XCTestCase {
  func testEquatable_SameSetAndLimit() {
    // GIVEN
    let content = ["A", "B", "C"]
    let limit = 3
    
    let firstSet = LimitedOrderedSet(content, limit: limit)
    let secondSet = LimitedOrderedSet(content, limit: limit)
    
    // THEN
    XCTAssertEqual(firstSet, secondSet)
  }
  
  func testEquatable_SameSetDifferentLimit() {
    // GIVEN
    let content = ["A", "B", "C"]
    
    let firstSet = LimitedOrderedSet(content, limit: 3)
    let secondSet = LimitedOrderedSet(content, limit: 4)
    
    // THEN
    XCTAssertNotEqual(firstSet, secondSet)
  }
}
