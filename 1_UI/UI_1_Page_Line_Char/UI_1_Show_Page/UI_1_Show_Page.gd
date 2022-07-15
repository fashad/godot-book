#UI_1_Show_Page
extends Node2D



#Taskber
signal i_HSlider



#Strt_Class------------------
func _ready():
	G_Class.pr_array_Page = make_2d_array()
	Show_Page_text()
	i_HSlider(G_Class.pr_array_Page.size())

#Process_Class----------------
func _process(_delta):
	Update_class()
	
#Update_class
func Update_class():
	if G_Class.Update_UI_1_Show_Page:
		i_HSlider(G_Class.pr_array_Page.size())
		Settings_Show_Page_text()
		G_Class.Update_UI_1_Show_Page = false



#----------------------------------------------------------------------
#Next-Back-Page------------------------
#Next
func _on_UI_Toush_Next_pressed():
	if G_Class.Counting < G_Class.pr_array_Page.size():
		G_Class.Counting += 1
	G_Class.Update_UI_1_Show_Page = true
	pass
#Back
func _on_UI_Toush_Back_pressed():
	if G_Class.Counting > 0 :
		G_Class.Counting -=1
	G_Class.Update_UI_1_Show_Page = true



func make_2d_array():
	var array_1 = Array()
	var coun_ok = 0
	var finsh = 0
	var start= true
	for i in G_Class.width:
		var array_2 = Array()
		for j in G_Class.Word_count_and_break:
			if coun_ok < G_Class.i_pr_Page.size():
				array_2.append(G_Class.i_pr_Page[coun_ok])
			else:
				if start:
					finsh = array_1.size()+1
					start = false
			coun_ok += 1
		array_1.append(array_2)
	var array_3 = []
	var i = 0
	while i < finsh:
		array_3.append(array_1[i])
		i +=1
	array_1 = array_3
	return array_1 



#Show-text
func Show_Page_text():
#	print(G_Class.pr_array_Page.size())
	if G_Class.Counting < G_Class.pr_array_Page.size():
		G_Class.i_split.clear()
		G_Class.i_split.append_array(G_Class.pr_array_Page[G_Class.Counting])
		$A/A2/S_1.spawn_pieces()

	pass
	
#Color_Style_View
func set_Color_Style_View():
	$A/A2/S_1/s1/A2/A1/Q_4.set_Color_Style_View()
	$A/A2/S_1._ready()

func Settings_Show_Page_text():
	Show_Page_text()


#UI_9_Taskber--------------------------------------------------
#show-HSlider
func _on_HSlider_value_changed(i_value):
	if G_Class.Counting < G_Class.pr_array_Page.size():
		G_Class.Counting = int(i_value)
	G_Class.Update_UI_1_Show_Page = true

#ii_HSlider
func i_HSlider(i_array_Page):
	emit_signal("i_HSlider" ,i_array_Page)
	
	


