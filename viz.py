#export LIBGL_ALWAYS_SOFTWARE=1
import pygfx as gfx
import sys
cube = gfx.Mesh(
    gfx.box_geometry(200, 200, 200),
    gfx.MeshPhongMaterial(color="#336699"),
)
gfx.show(cube)