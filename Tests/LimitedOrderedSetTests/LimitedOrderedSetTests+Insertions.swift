import XCTest
@testable import LimitedOrderedSet

final class LimitedOrderedSetInsertionsTests: XCTestCase {
  func testAppend_SetHasSpace() {
    // GIVEN
    let expectedCount = 2
    let itemToAdd = "B"
    var set = LimitedOrderedSet(["A"], limit: 10)
    
    // WHEN
    let result = set.append(itemToAdd)
    
    // THEN
    XCTAssertTrue(result.inserted)
    XCTAssertEqual(expectedCount, set.count)
    XCTAssertNotNil(result.index)
    XCTAssertEqual(itemToAdd, set[result.index!])
  }
  
  func testAppend_SetHasNoSpace() {
    // GIVEN
    let limit = 3
    let itemToAdd = "D"
    var set = LimitedOrderedSet(["A", "B", "C"], limit: limit)
    
    // WHEN
    let result = set.append(itemToAdd)
    
    // THEN
    XCTAssertFalse(result.inserted)
    XCTAssertTrue(set.isFull)
    XCTAssertNil(result.index)
  }
  
  func testAppendFromSequence_SetHasSpace() {
    // GIVEN
    let limit = 6
    let initialContent = ["A", "B", "C"]
    let contentToAdd = ["D", "E", "F"]
    var set = LimitedOrderedSet(initialContent, limit: limit)
    
    // WHEN
    set.append(contentsOf: contentToAdd)
    
    // THEN
    XCTAssertEqual(initialContent.count + contentToAdd.count, set.count)
    XCTAssertTrue(set.isFull)
    XCTAssertEqual(contentToAdd, Array(set[initialContent.count..<set.count]))
  }
  
  func testAppendFromSequence_SetHasNoSpace() {
    // GIVEN
    let limit = 4
    let initialContent = ["A", "B", "C"]
    let contentToAdd = ["D", "E", "F"]
    var set = LimitedOrderedSet(initialContent, limit: limit)
    
    // WHEN
    set.append(contentsOf: contentToAdd)
    
    // THEN
    XCTAssertEqual(limit, set.count)
    XCTAssertTrue(set.isFull)
    XCTAssertEqual(contentToAdd.first!, set.last!)
  }
  
  func testInsertAtIndex_SetHasSpace() {
    // GIVEN
    let limit = 3
    let itemToAdd = "B"
    var set = LimitedOrderedSet(["A", "C"], limit: limit)
    
    // WHEN
    let result = set.insert(itemToAdd, at: 1)
    
    // THEN
    XCTAssertTrue(result.inserted)
    XCTAssertTrue(set.isFull)
    XCTAssertNotNil(result.index)
    XCTAssertEqual(itemToAdd, set[result.index!])
  }
  
  func testInsertAtIndex_SetHasNoSpace_ShouldDropLast() {
    // GIVEN
    let limit = 3
    let initialContent = ["A", "B", "C"]
    let itemToAdd = "D"
    var set = LimitedOrderedSet(initialContent, limit: limit)
    
    // WHEN
    let result = set.insert(itemToAdd, at: 1, ifFull: .dropLast)
    
    // THEN
    XCTAssertTrue(result.inserted)
    XCTAssertTrue(set.isFull)
    XCTAssertNotNil(result.index)
    XCTAssertEqual(itemToAdd, set[result.index!])
    XCTAssertFalse(set.contains(initialContent.last!))
  }
  
  func testInsertAtIndex_SetHasNoSpace_ShouldDropFirst() {
    // GIVEN
    let limit = 3
    let initialContent = ["A", "B", "C"]
    let itemToAdd = "D"
    var set = LimitedOrderedSet(initialContent, limit: limit)
    
    // WHEN
    let result = set.insert(itemToAdd, at: 1, ifFull: .dropFirst)
    
    // THEN
    XCTAssertTrue(result.inserted)
    XCTAssertTrue(set.isFull)
    XCTAssertNotNil(result.index)
    XCTAssertEqual(itemToAdd, set[result.index!])
    XCTAssertFalse(set.contains(initialContent.first!))
  }
  
  func testInsertAtIndex_SetHasNoSpace_ShouldReject() {
    // GIVEN
    let limit = 3
    let initialContent = ["A", "B", "C"]
    let itemToAdd = "D"
    var set = LimitedOrderedSet(initialContent, limit: limit)
    
    // WHEN
    let result = set.insert(itemToAdd, at: 1, ifFull: .reject)
    
    // THEN
    XCTAssertFalse(result.inserted)
    XCTAssertEqual(initialContent, Array(set))
  }
}
