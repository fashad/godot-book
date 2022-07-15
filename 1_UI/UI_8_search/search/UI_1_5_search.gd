#UI_1_5_search
extends Node2D

var Program = preload("res://3_Data/Program_application.gd")
var i_Result= preload("res://1_UI/UI_1_5_search/search_Result/UI_1_5_serh_Result.tscn")


func _on_Button_4_pressed():
	get_tree().change_scene("res://1_UI/UI_1_4_Toush/UI_1_4_Toush.tscn")



func _on_Button_ok_pressed():
	var pr =Program.new()
	var rt =i_Result.instance()
	get_node("A_1").add_child(rt)
	rt.position =Vector2(0,200)
	
	var get_edittext = $A_1/A_2/Show/A_1/A_2/A_2/A_1/PersianTextEdit.textedit.text
	var i_split = pr.text_ok.split(" " ,"	","\n")
	for i in i_split:
		if get_edittext == i:
			print("hi>> " ,i)
