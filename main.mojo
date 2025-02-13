# # naive impl
from collections import Dict
from memory import ArcPointer
from cores.collections.sparseset import SparseSet


trait ComponentType(Copyable, Movable):
    pass


@register_passable("trivial")
struct Entity:
    var id: UInt64
    var tag:UInt64


@register_passable("trivial")
struct Position(ComponentType):
    var x: Float64
    var y: Float64
    var z: Float64


# @value
# struct Query:
#     # struct Query[*CTs: ComponentType]: TODO: ref to bevy and flecs

#     var current: Int
#     var max: Int

#     fn __init__(mut self, max: Int):
#         self.current = 0
#         self.max = max

#     # fn __iter__(self) -> Query[*CTs]:
#     # return self
#     fn __iter__(self) -> Query:
#         return self

#     fn __len__(self):
#         ...

#     fn __next__(self) -> Entity:
#         e = Entity(42)
#         return e

#     fn __has_next__(self) -> Bool:
#         if self.current >= self.max:
#             return False
#         return True


struct World[*CTs: ComponentType]():
    #     """
    #     CTs: The Components will used for this world.
    #     """

    alias CTS = CTs
    #     var entities: List[Entity]
    #     var components: List[Self.CTS.IterType]
    #     var counter: UInt64

    fn __init__(mut self):
        alias a = Self.CTS
        print("pass")
        ...
        # self.entities = List[Entity]()
        # self.counter = 1
        # self.components = List[Self.CTS.IterType]()


#     fn add_entity[*CTs: ComponentType](mut self, *c: *CTs):
#         entity = Entity(self.counter)
#         self.counter += 1
#         self.entities.append(entity^)

#     # fn query[*CTs: ComponentType](mut self) -> Query:
#     # return Query()
#     fn query(mut self) -> Query:
#         return Query(len(self.entities))


fn main():
    pass
    var world = World[Entity,Position]()
    
#     world.add_entity(Name("Alice"))
#     world.add_entity(Name("Bob"), Position(0, 0, 0))
#     world.add_entity(Name("Cris"), Position(0, 1, 2))
#     world.add_entity(Position(0, 1, 2))
#     for ent in world.query():
#         print(ent.id)
#         #TODO: How to get entity with same component(archetype)
#         ...
