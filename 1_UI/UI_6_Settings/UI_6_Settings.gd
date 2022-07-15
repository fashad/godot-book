#UI_6_Settings
extends Node2D

#Camera

signal zoom_Camer
signal i_Style_View
signal Show_Page_text

func _ready():
	showtext_All()

func _process(_delta):
	if G_Class.Update_UI_6_Settings:
		G_Class.Update_UI_6_Settings = false
		showtext_All()
#	i_HSlider_Camer()
	

func Update_UI_6_Settings():
	G_Class.Update_UI_6_Settings = true

#Close
func Button_Close():
	visible = false
	get_parent().get_node("UI_Toush").click_Menu = true
#	get_tree().current_scene.click_Menu = true


#Font-----------------------------------------------------
#show-text
func showtext_All():
	$A1/A1/A2/A1/Aq/A/www/A2/Label_Word.text =String(G_Class.i_ch)
	$A1/A1/A2/A1/A3/A1/A2/B1/A2/Label_size.text = String(G_Class.font_size)
	$A1/A1/A2/A1/A3/A1/A1/xxx_1/A_2/Label_LineSpacing.text = String(G_Class.font_line_top_down)
	$A1/A1/A2/A1/A4/A1/A1/A1/A1/tt1/A2/Label_Style.text =str(G_Class.font_style)

#Button_Font_big
func Button_Font_big():
	if G_Class.font_size < 25:
		G_Class.font_size += 1
		Update_UI_6_Settings()
		Signals_Style_View()
		


#Button_Font_Small
func Button_Font_Small():
	if G_Class.font_size > 10:
		G_Class.font_size -= 1
		Update_UI_6_Settings()
		Signals_Style_View()

		
		

#Font_Style +1
func Button_Font_Style_1():
	if G_Class.font_style == 5:
		G_Class.font_style = 0
		
	else:
		G_Class.font_style += 1
	Update_UI_6_Settings()
	Signals_Style_View()
	


#Font_Style -1
func Button_Font_Style_2():
	if G_Class.font_style == 0:
		G_Class.font_style = 5

	else:
		G_Class.font_style -= 1
	Update_UI_6_Settings()
	Signals_Style_View()
	

#Font_Line_Top_Down-----------------------------------
#Button_Font_Line_Down
func Button_Font_Line_Down():
	if G_Class.font_line_top_down > 0:
		G_Class.font_line_top_down -= 1
		Update_UI_6_Settings()
		Signals_Style_View()


		


#Button_Font_Line_Top
func Button_Font_Line_Top():
	if G_Class.font_line_top_down < 25:
		G_Class.font_line_top_down += 1
		Update_UI_6_Settings()
		Signals_Style_View()
		



#Camera_zoom-------------------------------------
#HSlider
func _on_HSlider_Camer_value_changed(i_value):
	var Coun_Camer = 1
	$A1/A1/A2/A1/Aq/A/A2/A1/A2/HSlider_Camer.max_value = 3
	Coun_Camer = i_value
	if Coun_Camer > 1 && Coun_Camer <4:
		print(Coun_Camer)
		$A1/A1/A2/A1/Aq/A/A2/A1/A2/HSlider_Camer.value = Coun_Camer
		G_Class.camera_zoomed = Vector2(Coun_Camer , Coun_Camer)
		emit_signal("zoom_Camer")




#Button_Reducezoom
func _on_Reducezoom_pressed():
	var Coun_Camer = G_Class.camera_zoomed.x
	if Coun_Camer > 1:
		Coun_Camer -= 1
		G_Class.camera_zoomed =Vector2(Coun_Camer ,Coun_Camer)
		emit_signal("zoom_Camer")
		$A1/A1/A2/A1/Aq/A/A2/A1/A2/HSlider_Camer.value = Coun_Camer


#Button_Zoom_in
func _on_Zoom_in_pressed():
	var Coun_Camer = G_Class.camera_zoomed.x
	print(Coun_Camer)
	if Coun_Camer < 3:
		Coun_Camer += 1
		G_Class.camera_zoomed =Vector2(Coun_Camer ,Coun_Camer)
		emit_signal("zoom_Camer")
		$A1/A1/A2/A1/Aq/A/A2/A1/A2/HSlider_Camer.value = Coun_Camer

	
	
	



func Button_The_whole_line():
	G_Class.size_flags_horizontal= 2
	Signals_Style_View()
	pass


func Button_Assumption():
	G_Class.size_flags_horizontal= 0
	Signals_Style_View()

func Signals_Style_View():
	emit_signal("i_Style_View")
	
		

#Button Number of words per line-------------------------
#Word_many
func Button_Word_many():
	if G_Class.i_ch == 75:
		G_Class.i_ch = 10
		
	else:
		G_Class.i_ch += 1
	Update_UI_6_Settings()
	Signals_Style_View()
	emit_signal("Show_Page_text")
	pass

#word_lowercase
func Button_word_lowercase():
	if G_Class.i_ch == 10:
		G_Class.i_ch = 75

	else:
		G_Class.i_ch -= 1
	Update_UI_6_Settings()
	Signals_Style_View()
	emit_signal("Show_Page_text")

#Backgrand_Color--------------------------------------------------------------------------
#Backgrand_Defalt
func _on_A_colr_defalt_pressed():
	for i in G_Class.pr_array_Page.size()-1:
		for j in G_Class.pr_array_Page[i].size():
				G_Class.pr_array_Page[i][j].i_Color = "White"
	G_Class.Backgrand ="Defalt"
	Signals_Style_View()

#Backgrand_White
func _on_A_colr_White_pressed():
	for i in G_Class.pr_array_Page.size()-1:
		for j in G_Class.pr_array_Page[i].size():
				G_Class.pr_array_Page[i][j].i_Color = "Black"
	G_Class.Backgrand ="White"
	Signals_Style_View()

#Backgrand_Black
func _on_A_colr_Black_pressed():
	for i in G_Class.pr_array_Page.size()-1:
		for j in G_Class.pr_array_Page[i].size():
				G_Class.pr_array_Page[i][j].i_Color = "White"
	G_Class.Backgrand ="Black"
	Signals_Style_View()

#Backgrand_Black
func _on_A_colr_yellow_pressed():
	for i in G_Class.pr_array_Page.size()-1:
		for j in G_Class.pr_array_Page[i].size():
				G_Class.pr_array_Page[i][j].i_Color = "Yellowing"
	G_Class.Backgrand ="Black_Yellowing"
	Signals_Style_View()
