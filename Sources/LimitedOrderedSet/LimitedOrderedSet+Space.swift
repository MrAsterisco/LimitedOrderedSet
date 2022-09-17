extension LimitedOrderedSet {
  public var count: Int {
    storage.count
  }
  
  public var isFull: Bool {
    count == limit
  }
  
  public var availableSpaces: Int {
    limit - count
  }
  
  public var isEmpty: Bool {
    storage.isEmpty
  }
}
