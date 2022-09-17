# LimitedOrderedSet
An implementation of a limited ordered set in Swift, based on the [OrderedSet](https://github.com/apple/swift-collections/blob/main/Sources/OrderedCollections/OrderedSet/OrderedSet.swift).

You can use this data structure to enforce a limit on the amount of non-equal items stored in a collection.

## Installation
LimitedOrderedSet is available through [Swift Package Manager](https://swift.org/package-manager).

```swift
.package(url: "https://github.com/MrAsterisco/LimitedOrderedSet", from: "<see GitHub releases>")
```

### Latest Release
To find out the latest version, look at the Releases tab of this repository.

## Usage
A `LimitedOrderedSet` works exactly like an `OrderedSet` with the addition of a limit.

You can create a `LimitedOrderedSet` from any `Sequence`:

```swift
let set = LimitedOrderedSet(["A", "B", "C"], limit: 3)
```

The `limit` you specify is used to determine the maximum capacity of the `OrderedSet`. You will be able to append or insert items into the set until you hit the specified limit.

```swift
let set = LimitedOrderedSet(limit: 2)
set.append("A") // ✅ Added
set.append("B") // ✅ Added

set.isFull // <-- ✅ true

set.append("B") // ❌ Not Added
```

If you specify an index, you can also control the behavior of the set when attempting to add new items while it's full.

```swift
let set = LimitedOrderedSet(["A", "B"], limit: 2)

// 1️⃣ Drop Last Item
set.insert("C", at: 1, ifFull: .dropLast)
print(set) // <-- ["A", "C"]

// 2️⃣ Drop First Item
set.insert("C", at: 1, ifFull: .dropFirst)
print(set) // <-- ["B", "C"]

// 3️⃣ Reject
set.insert("C", at: 1, ifFull: .reject) // ❌ Not Added
print(set) // <-- ["A", "B"], unchanged
```

## Documentation
The class definition is document, but most of the methods are not (yet). Documentation will be improved with future releases.

## Compatibility
LimitedOrderedSet is compatible with all Apple platforms.

LimitedOrderedSet depends on:
- `swift-collections/OrderedSet` version 1.

## Contributions
All contributions to expand the library are welcome. Fork the repo, make the changes you want, and open a Pull Request.

If you make changes to the codebase, I am not enforcing a coding style, but I may ask you to make changes based on how the rest of the library is made.

## Status
This library is under **active development**. It is used in one app in Production.

Even if most of the APIs come from the Swift Standard Library, **they may change in the future**; but you don't have to worry about that, because releases will follow [Semantic Versioning 2.0.0](https://semver.org/).

## License
LimitedOrderedSet is distributed under the MIT license. [See LICENSE](https://github.com/MrAsterisco/LimitedOrderedSet/blob/main/LICENSE) for details. 
