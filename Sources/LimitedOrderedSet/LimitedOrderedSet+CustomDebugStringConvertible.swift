extension LimitedOrderedSet: CustomDebugStringConvertible {
  public var debugDescription: String {
    "\(debugTypeName)[" +
    self
      .map { "\($0)" }
      .joined(separator: ", ")
    + "]"
  }
  
  var debugTypeName: String {
    "LimitedOrderedSet<\(Element.self)>"
  }
}
