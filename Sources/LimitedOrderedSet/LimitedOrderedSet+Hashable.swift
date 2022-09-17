extension LimitedOrderedSet: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(storage)
    hasher.combine(limit)
  }
}
