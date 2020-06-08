extends Control

var animals = {
	"bear": {
		"path": "res://assets/animalpackredux/PNG/Round without details (outline)/bear.png",
		"question": "Is this bear brown?",
		"answer": true
	},
	"chicken": {
		"path": "res://assets/animalpackredux/PNG/Round without details (outline)/chicken.png",
		"question": "Does this chicken have any red parts?",
		"answer": true
	},
	"cow": {
		"path": "res://assets/animalpackredux/PNG/Round without details (outline)/cow.png",
		"question": "Is this cow's image round in shape?",
		"answer": true
	},
	"femalePersonBehindBack": {
		"path": "res://assets/tooncharacters/Female person/PNG/Poses HD/character_femalePerson_behindBack.png",
		"question": "Is she hiding her hands?",
		"answer": true
	},
	"femaleAdventurerInteract": {
		"path": "res://assets/tooncharacters/Female adventurer/PNG/Poses HD/character_femaleAdventurer_interact.png",
		"question": "Is she hiding her hands?",
		"answer": false
	},
	"maleAdventurerThink": {
		"path": "res://assets/tooncharacters/Male adventurer/PNG/Poses HD/character_maleAdventurer_think.png",
		"question": "Does he have caucasian(white) skin?",
		"answer": true
	},
	"malePersonDuck": {
		"path": "res://assets/tooncharacters/Male person/PNG/Poses HD/character_malePerson_duck.png",
		"question": "Does he have caucasian(white) skin?",
		"answer": false
	},
	"robotShoveBack": {
		"path": "res://assets/tooncharacters/Robot/PNG/Poses HD/character_robot_shoveBack.png",
		"question": "Is this a human being?",
		"answer": false
	},
	"zombieThink": {
		"path": "res://assets/tooncharacters/Zombie/PNG/Poses HD/character_zombie_think.png",
		"question": "Is he infected?",
		"answer": true
	}
}

onready var tex = $Panel/MarginContainer/VBoxContainer/Items/Item/Image
onready var question = $Panel/MarginContainer/VBoxContainer/Title/MainTitle/Question
onready var correctVal = $Panel/MarginContainer/VBoxContainer/Title/VBoxContainer/correct/val
onready var wrongVal = $Panel/MarginContainer/VBoxContainer/Title/VBoxContainer/wrong/val

var currentIndex = 0
var correct = 0
var wrong = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	tex.texture = load(animals["bear"].path)
	question.text = animals["bear"].question

func _process(_delta):
	correctVal.text = str(correct)
	wrongVal.text = str(wrong)

func _on_yesBtn_pressed():
	var keys = animals.keys()
	keys.sort()
	_checkAnswer(keys[currentIndex], true)
	_nextTexture()

func _nextTexture():
	var keys = animals.keys()
	keys.sort()
	currentIndex = currentIndex + 1
	if currentIndex >= keys.size():
		currentIndex = keys.size() - 1
		get_tree().change_scene("res://ui/CompletionScreen.tscn")
	tex.texture = load(animals[keys[currentIndex]].path)
	question.text = animals[keys[currentIndex]].question

func _checkAnswer(key, val):
	if animals[key].answer == val:
		correct += 1
	else:
		wrong += 1

func _prevTexture():
	var keys = animals.keys()
	keys.sort()
	currentIndex = currentIndex - 1
	if currentIndex <= 0:
		currentIndex = 0
	tex.texture = load(animals[keys[currentIndex]].path)
	question.text = animals[keys[currentIndex]].question


func _on_noBtn_pressed():
	var keys = animals.keys()
	keys.sort()
	_checkAnswer(keys[currentIndex], false)
	_nextTexture()
