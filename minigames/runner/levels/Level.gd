extends Node2D

export (PackedScene) var level

onready var ground = $ground
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_ground()
	ground.hide()
	

func spawn_ground():
	var count = 0
	print("yaah")
	for cell in ground.get_used_cells():
		var id = ground.get_cellv(cell)
		var type = ground.tile_set.tile_get_name(id)
		if type == "ground":
			count = count + 1
			print(str(count))
			var d = level.instance()
			var pos = ground.map_to_world(cell)
			d.init(pos + ground.cell_size / 2)
			call_deferred("add_child", d)
#			d.connect('entered', self, '_on_Door_entered')


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
