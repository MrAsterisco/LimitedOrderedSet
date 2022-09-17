import XCTest
@testable import LimitedOrderedSet

final class LimitedOrderedSetInitializersTests: XCTestCase {
  func testInit_SameSizeSequence() {
    // GIVEN
    let content = ["A", "B", "C"]
    let limit = content.count
    
    // WHEN
    let set = LimitedOrderedSet(content, limit: limit)
    
    // THEN
    XCTAssertEqual(Array(set), content)
    XCTAssertTrue(set.isFull)
  }
  
  func testInit_ShorterSequence() {
    // GIVEN
    let content = ["A"]
    let limit = 3
    
    // WHEN
    let set = LimitedOrderedSet(content, limit: limit)
    
    // THEN
    XCTAssertEqual(Array(set), content)
    XCTAssertFalse(set.isFull)
  }
  
  func testInit_LongerSequence() {
    // GIVEN
    let content = ["A", "B", "C"]
    let limit = 2
    
    // WHEN
    let set = LimitedOrderedSet(content, limit: limit)
    
    // THEN
    XCTAssertEqual(limit, set.count)
    XCTAssertTrue(set.isFull)
    XCTAssertEqual(content[0], set[0])
    XCTAssertEqual(content[1], set[1])
  }
}
