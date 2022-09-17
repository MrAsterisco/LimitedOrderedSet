import OrderedCollections

extension LimitedOrderedSet {
  public init<S: Sequence>(_ elements: S, limit: Int) where S.Element == Element {
    self.init(
      storage: Self.generateStorage(capacity: limit, content: elements),
      limit: limit
    )
  }
}

extension LimitedOrderedSet {
  public init(_ elements: Self) {
    self = elements
  }
}

extension LimitedOrderedSet {
  public init<C: RandomAccessCollection>(_ elements: C, limit: Int) where C.Element == Element {
    self.init(
      storage: Self.generateStorage(capacity: limit, content: elements),
      limit: limit
    )
  }
}

private extension LimitedOrderedSet {
  static func generateStorage<S: Sequence>(capacity: Int, content: S) -> OrderedSet<S.Element> where S.Element: Hashable {
    var storage = OrderedSet<S.Element>(minimumCapacity: capacity, persistent: true)
    storage.append(contentsOf: content.prefix(capacity))
    return storage
  }
}
