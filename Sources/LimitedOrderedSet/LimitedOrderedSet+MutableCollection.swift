extension LimitedOrderedSet {
  public mutating func swapAt(_ i: Int, _ j: Int) {
    storage.swapAt(i, j)
  }
  
  public mutating func partition(by belongsInSecondPartition: (Element) throws -> Bool) rethrows -> Int {
    try storage.partition(by: belongsInSecondPartition)
  }
}

extension LimitedOrderedSet {
  public mutating func sort(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows {
    try storage.sort(by: areInIncreasingOrder)
  }
}

extension LimitedOrderedSet where Element: Comparable {
  public mutating func sort() {
    storage.sort()
  }
}

extension LimitedOrderedSet {
  public mutating func shuffle() {
    storage.shuffle()
  }
  
  public mutating func shuffle<T: RandomNumberGenerator>(using generator: inout T) {
    storage.shuffle(using: &generator)
  }
}

extension LimitedOrderedSet {
  public mutating func reverse() {
    storage.reverse()
  }
}
