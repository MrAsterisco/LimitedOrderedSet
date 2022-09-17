extension LimitedOrderedSet: CustomStringConvertible {
  public var description: String {
    "[" + self
      .map { "\($0)" }
      .joined(separator: ", ") + "]"
  }
}
