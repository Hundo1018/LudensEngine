struct Name:
    var name: String


struct Position:
    var x: Int
    var y: Int
    var z: Int


struct Velocity:
    var x: Int
    var y: Int
    var z: Int


struct Rotation:
    var x: Int
    var y: Int
    var z: Int


struct Scale:
    var x: Int
    var y: Int
    var z: Int


fn query_name_system[Name: Name]():
    if Name.name == "a":
        pass


fn main():
    print("asd")
    # TODO
    # var World: AnyType = World()
    # World.add_system(Entity(Position, Rotation, Scale))
