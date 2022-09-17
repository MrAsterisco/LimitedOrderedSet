extension LimitedOrderedSet {
  public mutating func removeAll(keepingCapacity keepCapacity: Bool = false) {
    storage.removeAll(keepingCapacity: keepCapacity)
  }
  
  public mutating func remove(at index: Int) {
    storage.remove(at: index)
  }
  
  public mutating func removeSubrange(_ bounds: Range<Int>) {
    storage.removeSubrange(bounds)
  }
  
  public mutating func removeSubrange<R: RangeExpression>(_ bounds: R) where R.Bound == Int {
    removeSubrange(bounds.relative(to: self))
  }
  
  public mutating func removeLast() -> Element {
    storage.removeLast()
  }
  
  public mutating func removeLast(_ n: Int) {
    storage.removeLast(n)
  }
  
  public mutating func removeFirst() {
    storage.removeFirst()
  }
  
  public mutating func removeFirst(_ n: Int) {
    storage.removeFirst(n)
  }
  
  public mutating func removeAll(where shouldBeRemoved: (Element) throws -> Bool) rethrows {
    try storage.removeAll(where: shouldBeRemoved)
  }
}
