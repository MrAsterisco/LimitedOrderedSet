import XCTest
@testable import LimitedOrderedSet

final class LimitedOrderedSetCodableTests: XCTestCase {
  func testEncodingDecoding_ShouldGiveSameSet() throws {
    // GIVEN
    let limit = 3
    let set = LimitedOrderedSet(["B", "A", "C"], limit: limit)
    
    // WHEN
    let encoded = try JSONEncoder().encode(set)
    let decoded = try JSONDecoder().decode(LimitedOrderedSet<String>.self, from: encoded)
    
    // THEN
    XCTAssertEqual(set, decoded)
  }
}
