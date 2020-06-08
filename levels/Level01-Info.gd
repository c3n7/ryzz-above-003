extends "res://notes/conditions.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _txt_load():
	var file = File.new()
	file.open("res://notes/conditions.gd", File.READ)
	info = file.get_as_text()
	file.close()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/MarginContainer/VBoxContainer/Text.clear()
	$Panel/MarginContainer/VBoxContainer/Text.append_bbcode(info.en)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Proceed_pressed():
	get_tree().change_scene("res://levels/Level01.tscn")
