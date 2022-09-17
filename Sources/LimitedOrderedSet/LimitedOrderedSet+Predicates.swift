extension LimitedOrderedSet {
  public func firstIndex(of element: Element) -> Int? {
    storage.firstIndex(of: element)
  }
  
  public func lastIndex(of element: Element) -> Int? {
    storage.lastIndex(of: element)
  }
}

extension LimitedOrderedSet {
  public func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> any Sequence {
    try storage.filter(isIncluded)
  }
}

extension LimitedOrderedSet {
  public func isSubset<S: Sequence>(of other: S) -> Bool where S.Element == Element {
    storage.isSubset(of: other)
  }
  
  public func isStrictSubset<S: Sequence>(of other: S) -> Bool where S.Element == Element {
    storage.isStrictSubset(of: other)
  }
}

extension LimitedOrderedSet {
  public func isSuperset<S: Sequence>(of other: S) -> Bool where S.Element == Element {
    storage.isSuperset(of: other)
  }
  
  public func isStrictSuperset<S: Sequence>(of other: S) -> Bool where S.Element == Element {
    storage.isStrictSuperset(of: other)
  }
}

extension LimitedOrderedSet {
  public func isDisjoint<S: Sequence>(with other: S) -> Bool where S.Element == Element {
    storage.isDisjoint(with: other)
  }
}
