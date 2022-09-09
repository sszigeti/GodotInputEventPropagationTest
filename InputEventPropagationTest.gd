extends Control


onready var button:Button = $"%Button"
onready var hoverTrigger = $"%HoverTrigger"

onready var button2:Button = $"%Button2"
onready var hoverTrigger2 = $"%HoverTrigger2"

onready var label:Label = $"%Label"

var state := {
	button_pressed = { 1: false, 2: false },
	trigger_hovered = { 1: false, 2: false }
}
var original_label_content:String


func _ready() -> void:
	original_label_content = label.text


func _process(_delta:float) -> void:
	label.text = "%s\n\n%s" % [original_label_content, JSON.print(state, "  ")]


func _on_Button_button_changed(which:int, button_pressed:bool) -> void:
	state.button_pressed[which] = button_pressed


func _on_HoverTrigger_hover_changed(which:int, trigger_hovered:bool) -> void:
	state.trigger_hovered[which] = trigger_hovered
