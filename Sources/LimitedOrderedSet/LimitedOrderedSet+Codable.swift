import OrderedCollections

fileprivate extension LimitedOrderedSet {
  enum CodingKeys: CodingKey {
    case  content,
          limit
  }
}

extension LimitedOrderedSet: Encodable where Element: Encodable {
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(storage, forKey: .content)
    try container.encode(limit, forKey: .limit)
  }
}

extension LimitedOrderedSet: Decodable where Element: Decodable {
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let content = try container.decode(OrderedSet<Element>.self, forKey: .content)
    let limit = try container.decode(Int.self, forKey: .limit)
    
    self.init(
      storage: content,
      limit: limit
    )
  }
}
