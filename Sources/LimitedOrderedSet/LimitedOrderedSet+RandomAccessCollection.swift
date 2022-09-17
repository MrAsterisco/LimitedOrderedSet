import OrderedCollections

extension LimitedOrderedSet: RandomAccessCollection {
  public typealias Index = OrderedSet<Element>.Index
  public typealias Indices = OrderedSet<Element>.Indices
  public typealias SubSequence = OrderedSet<Element>.SubSequence
  public typealias Iterator = OrderedSet<Element>.Iterator
  
  public var startIndex: OrderedSet<Element>.Index {
    storage.startIndex
  }
  
  public var endIndex: OrderedSet<Element>.Index {
    storage.endIndex
  }
  
  public var indices: OrderedCollections.OrderedSet<Element>.Indices {
    storage.indices
  }
  
  public func makeIterator() -> OrderedSet<Element>.Iterator {
    storage.makeIterator()
  }
  
  public func index(after i: OrderedCollections.OrderedSet<Element>.Index) -> OrderedSet<Element>.Index {
    storage.index(after: i)
  }
  
  public subscript(position: OrderedSet<Element>.Index) -> Element {
    storage[position]
  }
  
  public subscript(bounds: Range<OrderedSet<Element>.Index>) -> OrderedSet<Element>.SubSequence {
    storage[bounds]
  }
}
