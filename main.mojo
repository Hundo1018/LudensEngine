from python import Python


fn main() raises:
    var gfx = Python.import_module("pygfx")
    cube = gfx.Mesh(
        gfx.box_geometry(200, 200, 200),
        gfx.MeshPhongMaterial(color="#336699"),
    )
    gfx.show(cube)
    print(gfx)
