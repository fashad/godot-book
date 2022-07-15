#UI_3_Load
extends Node2D

#File.READ
onready var i_file = "res://3_Data/text_test.tres"
var i_word = load("res://3_Data/Object_Word.gd")
var pr_Page = []



func _ready():
	$A_2.play("play")
	yield(get_tree().create_timer(1.5) ,"timeout")
	load_file()
	Objecti_fication_of_words()
#	show()
	get_tree().change_scene("res://1_UI/UI_4_start/UI_4_start.tscn")


#File-Page-show-Page--------------------------------
#load_file
func load_file():
	var f = File.new()
	f.open(i_file, File.READ)
#	var index = 1
	while not f.eof_reached():
		var line = f.get_line()
		if line :
			var Word = line.split(" ")
			pr_Page.append_array(Word)
#		index += 1
	f.close()
#	print("index " ,index)
#	print( "Word ",pr_Page.size())
#	print("j ", pr_Page.size())


func Objecti_fication_of_words():
#	print(pr_Page.size())
	for i in pr_Page.size():
		if !pr_Page[i].length() == 0:
			var i_wor = i_word.new()
			i_wor.set_list(i ,""+str(pr_Page[i]) ,"white")
			G_Class.i_pr_Page.append(i_wor)
		else:
#			print("hi")
			pass
#	print("length() == 0  ",G_Class.i_pr_Page.size())

func show():
	for i in  range(15):
		G_Class.i_pr_Page[i].show_text_var()
		
	
