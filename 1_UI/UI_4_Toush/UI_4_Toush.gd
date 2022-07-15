#UI_4_Toush , UI_Toush
extends Node2D

var click_Menu = true
var controlling = false
var width = 370
var height = 650
var One_touch = Vector2(0 ,0)
var Two_touch = Vector2(0 ,0)
var get_Two_One = []

signal Back_pressed
signal Next_pressed

	
#event
func _input(_event):
	if click_Menu:
		if Input.is_action_just_pressed("ui_touch"):
			One_touch = get_global_mouse_position()
			controlling = true
		
		if Input.is_action_just_released("ui_touch"):
			if controlling:
				Two_touch = get_global_mouse_position()
				controlling = false
				get_Two_One.clear()
				get_Two_One.append(One_touch.x)
				get_Two_One.append(One_touch.y)
				get_Two_One.append(Two_touch.x)
				get_Two_One.append(Two_touch.y)
				Run_Toush()

#Toush
func Run_Toush():                                           
	if !get_Two_One[0] >=get_Two_One[0] -10 && !get_Two_One[0] <= get_Two_One[0] + 10 && !get_Two_One[2] >=get_Two_One[2] -10 && !get_Two_One[2] <= get_Two_One[2] + 10 &&!get_Two_One[1] >=get_Two_One[1] -10 && !get_Two_One[1] <= get_Two_One[1] + 10 && !get_Two_One[3] >=get_Two_One[3] -10 && !get_Two_One[3] <= get_Two_One[3] + 10:
		is_Clicked_drag_One_Two()
	else:
		var i_touch = Vector2(get_Two_One[0] ,get_Two_One[1])
		is_grid_Touch_Click(i_touch)




func is_Clicked_drag_One_Two():
	if One_touch.x > Two_touch.x:
		Run_Next()
	else:
		Run_Back()

func is_grid_Touch_Click(i_touch):
	if i_touch.x >= 0 && i_touch.x < 150:
		if i_touch.y >= 0 && i_touch.y < 570:
			Run_Next()
			pass
	elif i_touch.x >= 150 && i_touch.x < 200:
		if i_touch.y >= 0 && i_touch.y < 570:
			Run_Menu()
	elif i_touch.x >= 200 && i_touch.x < 370:
		if i_touch.y >= 0 && i_touch.y < 570:
			Run_Back()


#Touch-Back
func Run_Back():
#	print("Back")
	get_parent().get_node("UI_7_Action_Bar").visible = false
	emit_signal("Back_pressed")
	controlling = false

#Touch-Menu
func Run_Menu():
#	print("Menu")
	get_parent().get_node("UI_7_Action_Bar").visible = true
	

#Touch-Next
func Run_Next():
#	print("Next")
	get_parent().get_node("UI_7_Action_Bar").visible = false
	emit_signal("Next_pressed")
	controlling = false


#Settings_show
func UI_8_Settings_show():
		get_parent().get_node("UI_6_Settings").visible = true
		click_Menu = false


#UI_7_Action_Bar-----------------------------------------------------------
#back Ativity
func Button_back_Ativity():
	get_tree().change_scene("res://1_UI/UI_4_start/UI_4_start.tscn")





