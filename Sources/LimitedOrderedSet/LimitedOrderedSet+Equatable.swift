extension LimitedOrderedSet: Equatable {
  public static func == (lhs: LimitedOrderedSet, rhs: LimitedOrderedSet) -> Bool {
    lhs.storage == rhs.storage
      && lhs.limit == rhs.limit
  }
}
