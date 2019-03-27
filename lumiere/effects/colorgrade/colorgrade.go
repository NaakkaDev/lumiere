components {
  id: "colorgrade"
  component: "/lumiere/effects/colorgrade/colorgrade.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "model"
  type: "model"
  data: "mesh: \"/lumiere/assets/quad.dae\"\n"
  "material: \"/lumiere/effects/colorgrade/colorgrade.material\"\n"
  "textures: \"\"\n"
  "textures: \"/examples/assets/custom/colorgrade_lut16.png\"\n"
  "skeleton: \"\"\n"
  "animations: \"\"\n"
  "default_animation: \"\"\n"
  "name: \"unnamed\"\n"
  ""
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "lut"
  type: "sprite"
  data: "tile_set: \"/lumiere/effects/colorgrade/colorgrade_lut.atlas\"\n"
  "default_animation: \"lut16\"\n"
  "material: \"/lumiere/effects/colorgrade/colorgrade_lut.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: 128.0
    y: 8.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
