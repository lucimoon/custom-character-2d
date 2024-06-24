@tool
class_name SpriteLayer2D extends Sprite2D
## A child of CustomSprite2D
## Defines a sprite layer whose animations
## are synced with sibling layers

## Color modulates sprite texture to support
## color variations for the same sprite
@export var color: Color = Color(1, 1, 1, 1):
  set(value):
    color = value
    _set_color(value)

## At least one variant is needed per layer.
## The first variant will be the default option
@export var variants: Array[Texture2D] = []

## Index of variant to display.
## Cannot be greater than maximum index of variants.
@export var selected_variant: int = 0:
  set(value):
    var max_index = variants.size() - 1

    if (value > max_index):
      selected_variant = max_index
    else:
      selected_variant = value

    if max_index >= 0: _set_texture()

## Changes color of selected variant
func _set_color(value: Color):
  modulate = value
  self_modulate = value

# Displays selected variant
func _set_texture():
  texture = variants[selected_variant]