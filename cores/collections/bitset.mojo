from collections import *
from bit import *


struct BitSet[size: UInt]:
    var bits: SIMD[DType.bool, size]

    fn __init__(mut self):
        self.bits = SIMD[DType.bool, size]()

    fn __getitem__(self, index: Int) -> Bool:
        return self.bits[index]

    fn __setitem__(mut self, index: Int, value: Bool):
        self.bits[index] = value

    fn set(mut self, index: Int) -> None:
        self.bits[index] = True

    fn reset(mut self, index: Int) -> None:
        self.bits[index] = False

    fn flip(mut self, index: Int):
        self.bits[index] = not self.bits[index]
