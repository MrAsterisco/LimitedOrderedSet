extension LimitedOrderedSet {
  public init(limit: Int) {
    self.init(
      storage: .init(minimumCapacity: limit, persistent: true),
      limit: limit
    )
  }
}

extension LimitedOrderedSet {
  public func contains(_ element: Element) -> Bool {
    storage.contains(element)
  }
}

extension LimitedOrderedSet {
  public mutating func remove(_ member: Element) -> Element? {
    storage.remove(member)
  }
}

extension LimitedOrderedSet {
  public mutating func formUnion<S: Sequence>(_ other: S) where S.Element == Element {
    append(contentsOf: other)
  }
  
  public func union<S: Sequence>(_ other: S) -> Self where S.Element == Element {
    var result = self
    result.formUnion(other)
    return result
  }
}

extension LimitedOrderedSet {
  public mutating func formIntersection<S: Sequence>(_ other: S) where S.Element == Element {
    storage.formIntersection(other)
  }
  
  public func intersection<S: Sequence>(_ other: S) -> Self where S.Element == Element {
    var result = self
    result.formIntersection(other)
    return result
  }
}

extension LimitedOrderedSet {
  public func symmetricDifference<S: Sequence>(_ other: S) -> any Sequence where S.Element == Element {
    storage.symmetricDifference(other)
  }
}

extension LimitedOrderedSet {
  public mutating func subtract<S: Sequence>(_ other: S) where S.Element == Element {
    storage.subtract(other)
  }
  
  public func subtracting<S: Sequence>(_ other: S) -> Self where S.Element == Element {
    var result = self
    result.storage.subtract(other)
    return result
  }
}
