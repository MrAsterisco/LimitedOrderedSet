import OrderedCollections

/// A limited ordered collection of unique elements.
///
/// Following the same concepts and behaviors of the `OrderedSet`, a limited ordered set
/// ensures that it cannot contain more than the specified amount of elements.
/// In other words, a limited set is effectively limited in its capacity to the number you specify when
/// initializing it.
///
/// Just like the `OrderedSet`, a limited ordered set maintains the order of the items as
/// they were added.
///
/// # Equality of Limited Ordered Sets
///
/// Two limited ordered sets are considered equal if they contain the same elements,
/// in the same order, and use the same limit.
///
/// # Sequence and Collection Operations
///
/// Limited ordered sets are random-access collections: members are assigned integer
/// indices, with the first element always being at index `0`.
///
/// Just like the `OrderedSet`, limited ordered sets cannot conform to the full `MutableCollection`
/// or `RangeReplaceableCollection` protocols.
/// Operations such as `MutableCollection`'s subscript setter or
/// `RangeReplaceableCollection`'s `replaceSubrange` assume the ability to
/// insert/replace arbitrary elements in the collection, but allowing that could
/// lead to duplicate values.
///
/// Limited ordered sets still provide partial implementations of these protocols, such as
/// `sort`, `shuffle`, `reverse`, and more.
///
/// # Fixed Capacity
///
/// Because the maximum amount of items is always known, limited ordered sets are initialized
/// with a fixed capacity that is persisted across inserts and deletions.
///
/// # Accessing the Contents of a Limited Ordered Set as an Array
///
/// When you need to pass the content of a limited ordered set to a function that only takes
/// an array value, the recommended approach is the same as the `OrderedSet`: use the `elements`
/// property to get the content as an `Array`.
///
/// However, unlike the `OrderedSet`, you are not allowed to mutate the `elements` property without
/// using the functions offered by the limited ordered set.
///
/// # Performance
///
/// For a more detailed view of performances, please refer to the documentation of the `OrderedSet`.
///
/// # Implementation Details
///
/// The limited ordered set stores its items in an `OrderedSet` and exposes functions to interact with it
/// in a way that always consider the `limit` you specify.
@frozen public struct LimitedOrderedSet<Element: Hashable> {
  public let limit: Int
  
  var storage = OrderedSet<Element>()
  
  init(storage: OrderedSet<Element>, limit: Int) {
    self.storage = storage
    self.limit = limit
  }
  
  var elements: [Element] {
    get {
      storage.elements
    }
  }
}
