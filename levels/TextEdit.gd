extends TextEdit

export var class_color: = Color(0.6, 0.6, 1.0)
export var member_color: = Color(0.6, 1.0, 0.6)
export var keyword_color: = Color(1.0, 0.6, 0.6)
export var quotes_color: = Color(1.0, 1.0, 0.6)


func _ready() -> void:
	add_color_region('"', '"', quotes_color)
	add_color_region("'", "'", quotes_color)
	for c in ClassDB.get_class_list():
		add_keyword_color(c, class_color)
		for m in ClassDB.class_get_property_list(c):
			for key in m:
				add_keyword_color(key, member_color)

	for k in keywords["list"]:
		add_keyword_color(k, keyword_color)


func _gui_input(event: InputEvent) -> void:
	get_tree().set_input_as_handled()

var keywords = {
	"list": [
		"onready",
		"var",
		"export",
		"if",
		"elif",
		"else",
		"for",
		"do",
		"while",
		"match",
		"switch",
		"case",
		"break",
		"continue",
		"pass",
		"return",
		"class",
		"extends",
		"is",
		"self",
		"tool",
		"signal",
		"func",
		"static",
		"const",
		"enum",
		"setget",
		"breakpoint",
		"preload",
		"yield",
		"assert",
		"remote",
		"master",
		"slave",
		"sync",
		"Color8",
		"ColorN",
		"abs",
		"acos",
		"asin",
		"assert",
		"atan",
		"atan2",
		"bytes2var",
		"cartesian2polar",
		"ceil",
		"char",
		"clamp",
		"convert",
		"cos",
		"cosh",
		"db2linear",
		"decials",
		"dectime",
		"def2rad",
		"dict2inst",
		"ease",
		"expo",
		"floor",
		"fmod",
		"fposmod",
		"funcref",
		"hash",
		"inst2dict",
		"instance_from_id",
		"inverse_lerp",
		"is_inf",
		"is_nan",
		"len",
		"lerp",
		"linear2db",
		"load",
		"log",
		"max",
		"min",
		"nearest_po2",
		"parse_json",
		"polar2cartesian",
		"pow",
		"preload",
		"print",
		"print_stack",
		"printerr",
		"printraw",
		"prints",
		"printt",
		"rad2def",
		"rand_range",
		"rand_seed",
		"randf",
		"randi",
		"randomize",
		"range",
		"range_lerp",
		"round",
		"seed",
		"sign",
		"sin",
		"sinh",
		"sqrt",
		"stepify",
		"str",
		"str2var",
		"tan",
		"tanh",
		"to_json",
		"type_exists",
		"typeof",
		"validate_json",
		"var2bytes",
		"var2str",
		"weakref",
		"wrapf",
		"wrapi",
		"yield"
	]

}
