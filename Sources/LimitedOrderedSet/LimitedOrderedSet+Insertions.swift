extension LimitedOrderedSet {
  public enum InsertBehavior {
    case  dropFirst,
          dropLast,
          reject
  }
}

extension LimitedOrderedSet {
  @discardableResult
  public mutating func append(_ item: Element) -> (inserted: Bool, index: Int?) {
    guard !isFull else { return (false, nil) }
    return storage.append(item)
  }
  
  public mutating func append<S: Sequence>(contentsOf sequence: S) where S.Element == Element {
    sequence
      .forEach { append($0) }
  }
}

extension LimitedOrderedSet {
  @discardableResult
  public mutating func insert(_ item: Element, at index: Int, ifFull behavior: InsertBehavior = .reject) -> (inserted: Bool, index: Int?) {
    switch behavior {
    case .dropFirst:
      if isFull {
        storage.removeFirst()
      }
      return storage.insert(item, at: index)
    case .dropLast:
      if isFull {
        storage.removeLast()
      }
      return storage.insert(item, at: index)
    case .reject:
      guard !isFull else { return (false, nil) }
      return storage.insert(item, at: index)
    }
  }
}
