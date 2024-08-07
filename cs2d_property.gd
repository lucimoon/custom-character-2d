@tool
class_name CSSpriteProperty
extends Node2D


signal color_changed(color: Color)
signal texture_changed(value: int)


@export var ui_name: String = ""
@export var color_presets: ColorPalette = null
@export var texture_previews: Array[Texture2D] = []

## The selected texture from the list
## Selects the greatest index when set too high
## Selects the lowest index (0) when set too low
@export var texture_index: int = 0:
  set(_value):
    texture_index= _value
    var preview_count: int = texture_previews.size()

    if _value >= preview_count:
      texture_index= preview_count - 1

    if _value < 0:
      texture_index= 0

    texture_changed.emit(texture_index)


var color: Color = Color.WHITE:
  set(value):
    color = value
    color_changed.emit(color)


func randomize():
  color = color_presets.colors.pick_random()
  texture_index = randi_range(0, texture_previews.size() - 1)
