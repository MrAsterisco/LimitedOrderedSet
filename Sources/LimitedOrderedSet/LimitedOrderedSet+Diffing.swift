@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension LimitedOrderedSet {
  public func difference(from other: Self) -> CollectionDifference<Element> {
    storage.difference(from: other)
  }
}
