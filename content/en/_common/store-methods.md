---
_comment: Do not remove front matter.
---

`Set`
: Sets the value of the given key.

`Get`
: (`any`) Returns the value of the given key.

`Add`
: Adds the given value to the existing value of the given key. If the existing value is a slice, `Add` appends the given value to the slice. Otherwise, `Add` combines the values with Go's `+` operator, such as adding two numbers or joining two strings. If the key does not exist, `Add` sets the value of the key.

`SetInMap`
: Takes a key, a map key, and a value, and sets the value of the map key within the map stored under the given key.

`DeleteInMap`
: Takes a key and a map key, and removes the map key from the map stored under the given key.

`GetSortedMapValues`
: (`[]any`) Returns the values of the map stored under the given key, sorted by map key.

`Delete`
: Removes the given key.
