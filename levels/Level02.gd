extends Control

onready var label = $Panel/MarginContainer/HBoxContainer/VBoxContainer/Label
onready var textedit = $Panel/MarginContainer/HBoxContainer/TextEdit

func save_file(content):
	var file = File.new()
	file.open("res://hello.gd", File.WRITE)
	file.store_string(content)
	file.close()

func load_file():
	var file = File.new()
	file.open("res://hello.gd", File.READ)
	var content = file.get_as_text()
	file.close()
	return content

# Called when the node enters the scene tree for the first time.
func _ready():
	textedit.text = load_file()

func _on_Button_pressed():
	save_file(textedit.text)
	var instance = load("res://hello.gd").new(222)
	label.text = str(instance.get_foo())
	pass # Replace with function body.
