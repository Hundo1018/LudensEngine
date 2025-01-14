from collections import *


trait EcsSet:
    """Set for ECS."""

    fn __init__(mut self, *values: Int) -> None:
        ...

    fn add(self, value: Int) -> None:
        ...

    fn contains(self, value: Int) -> Bool:
        ...

    fn iter(self, value: Int):
        ...

    fn remove(self, value: Int):
        ...


@value
struct SparseSet[fixed_size: Int](Sized, Boolable):
    alias _fixed_size: Int = fixed_size
    var _sparse: List[Int]
    """storage the index of dense array"""
    var _dense: List[Int]
    """storage the keys"""
    var _current: Int
    """for __iter__ __next__ using"""

    fn __init__(mut self, *keys: Int) -> None:
        self._sparse = List[Int]()
        self._dense = List[Int]()
        self._current = 0
        for _ in range(self._fixed_size):
            self._sparse.append(-1)
        for i in keys:
            self.add(i)

    fn __len__(self) -> Int:
        return len(self._dense)

    fn __bool__(self) -> Bool:
        return len(self) > 0

    fn add(mut self, key: Int) -> None:
        """Add a key into set."""
        if key in self:
            return
        """makesure the number does not exist."""
        self._dense.append(key)
        """update dense array"""
        self._sparse[key] = len(self._dense) - 1
        """update sparse array"""

    fn __contains__(self, key: Int) -> Bool:
        """Check the key whether or not in the set."""
        index = self._sparse[key]
        return index >= 0 and self._dense[index] == key

    fn remove(mut self, key: Int):
        """Remove the key from the set."""
        if key not in self:
            return
        index = self._sparse[key]
        self._sparse[key] = -1
        """remove map from sparse to dense"""

        self._dense[index] = self._dense[-1]
        _ = self._dense.pop()
        """remove the last index of dense"""

    fn __iter__(mut self) -> Self:
        self._current = 0
        return self

    fn __next__(mut self) -> Int:
        self._current += 1
        return self._dense[self._current - 1]

    fn __has_next__(mut self) -> Bool:
        return self._current < len(self._dense)
