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


struct SparseSet[fixed_size: Int](Sized, Boolable):
    alias _fixed_size: Int = fixed_size
    var _sparse: InlineList[Int, Self._fixed_size]
    """storage the index of dense array"""
    var _dense: List[Int]
    """storage the keys"""
    var _current: Int
    """for __iter__ __next__ using"""

    fn __init__(mut self, *keys: Int) -> None:
        self._sparse = InlineList[Int, self._fixed_size]()
        self._dense = List[Int]()
        self._current = -1

    fn __len__(self) -> Int:
        return len(self._dense)

    fn __bool__(self) -> Bool:
        return len(self) > 0

    fn add(mut self, key: Int) -> None:
        """Add a key into set."""
        if self.contains(key):
            return
        """makesure the number does not exist."""
        self._dense.append(key)
        """update dense array"""
        self._sparse[key] = len(self._dense)
        """update sparse array"""

    fn contains(self, key: Int) -> Bool:
        """Check the key whether or not in the set."""
        index = self._sparse[key]
        return index >= 0 and self._dense[index] == key

    fn remove(mut self, key: Int):
        """Remove the key from the set."""
        if not self.contains(key):
            return
        index = self._sparse[key]
        self._sparse[key] = -1
        """remove map from sparse to dense"""

        self._dense[index] = self._dense[-1]
        _ = self._dense.pop()
        """remove the last index of dense"""

    fn __copyinit__(out self, existing: Self):
        """Implement for __iter__."""
        self = Self()
        for i in self._dense:
            self.add(i[])

    fn __iter__(self) -> Self:
        return self

    fn __next__(mut self) -> Int:
        self._current += 1
        return self._dense[self._current]

    fn __has_next__(self) -> Bool:
        return True


fn main():
    var my_set = SparseSet[4](1, 2, 3, 4)
    for element in my_set:
        print(element)
