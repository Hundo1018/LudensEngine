import time
import pygfx as gfx
import wgpu
import wgpu.gui.auto
from wgpu.gui.auto import run
print( wgpu.gui.auto.__file__)

# 創建基本場景要素
canvas = wgpu.gui.auto.WgpuCanvas()
renderer = gfx.renderers.WgpuRenderer(canvas)
scene = gfx.Scene()

# 設置Camera
camera = gfx.PerspectiveCamera(70, 16 / 9)
camera.local.position = (0, 2, 5)
camera.look_at((0, 0, 0))

# 創建軌道控制器 綁定事件到renderer
controller = gfx.OrbitController(camera, register_events=renderer)

# 方塊
box_geometry1 = gfx.box_geometry(20, 20, 20)
box_material1 = gfx.MeshBasicMaterial(color=(1.0, 0.0, 0.0, 1.0))  # 红色
box1 = gfx.Mesh(box_geometry1, box_material1)
box1.local.position = (20, 0, 0)
scene.add(box1)

# 方塊2
box_geometry2 = gfx.box_geometry(20, 20, 20)
box_material2 = gfx.MeshBasicMaterial(color=(0.0, 0.0, 1.0, 1.0))  # 蓝色
box2 = gfx.Mesh(box_geometry2, box_material2)
box2.local.position = (-20, 0, 0)
scene.add(box2)

# 坐標軸
axes_helper = gfx.AxesHelper(size=2)
scene.add(axes_helper)

# 燈光
light = gfx.PointLight(color=(1.0, 1.0, 1.0), intensity=2.0)
light.local.position = (5, 5, 5)
scene.add(light)

# 渲染循環
def loop():
    renderer.render(scene, camera)
renderer.request_draw(loop)
# 等待關閉
run()
