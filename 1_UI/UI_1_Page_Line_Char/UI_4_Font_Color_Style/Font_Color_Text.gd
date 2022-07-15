#Font_Color_Text
extends Node

#Color_the_word
var list_Color =[]
var q_j_2 = 0
var q_i_Color =""
var line = Vector3.ZERO

#Style
var i_Style =[
	"res://addons/PersianTextEdit/Fonts/Vazir.ttf",
	"res://2_Fonts/BBaranOutline.ttf",
	"res://2_Fonts/BBaranOutlineItalic.ttf",
	"res://2_Fonts/BZar.ttf",
	"res://2_Fonts/BZiba.ttf",
	"res://2_Fonts/OpenSansSemibold.ttf",
	"res://2_Fonts/tahoma.ttf",
	"res://2_Fonts/tahomabd.ttf"
]




#font_Color_
func set_color_font(i_Label ,color_back):
	match color_back:
		"White":#White------
			i_Label.add_color_override("font_color" ,Color(1 ,1 ,1 ,1))
		"Black":#Black------
			i_Label.add_color_override("font_color" ,Color(0 ,0 ,0 ,1))
		"Yellowing":#Yellowing-----
			i_Label.add_color_override("font_color" ,Color(1 ,1 ,0 ,1))
		_:#White------
			i_Label.add_color_override("font_color" ,Color(1 ,1 ,1 ,1))
				


#Style
func Font_Style_line(i, sty ,i_font):
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data =load(i_Style[sty])
	dynamic_font.size =i_font
	dynamic_font.extra_spacing_top = G_Class.font_line_top_down
	G_Class.ch_array_Label[i].set("custom_fonts/font" ,dynamic_font)


#Color_the_word---------------------------------------------
func Find_the_desired_color(coun_ok ,word ,j_2 ,i_Color):
	line = Dial_the_Colored_words(word ,j_2)
	if coun_ok < line.x :
		list_Color.append(G_Class.ch_array_Label[coun_ok])
	q_j_2 = j_2
	q_i_Color = i_Color 
	pass
	
	
func Dial_the_Colored_words(words ,coun):
	var coun_line = Vector3.ZERO
	for i in range(coun):
		if coun_line.x < coun:
			coun_line.x = coun_line.x + words[i].x
			coun_line.y += 1
		else:
			for j in range(0,coun_line.y - 1):
				coun_line.z = coun_line.z + words[j].x
			break
	return coun_line
	

#color_font
func Pour_the_paint():
	var coun_len = 1
	while true:
		if coun_len < line.y:
			for i in range(0 ,line.z):
				set_color_font(list_Color[i] ,q_i_Color)
#				Font_Color.set_color_font(list_Color[i] ,"Black")
			coun_len += 1
		else:
			if line.y == 1:
				for i in range(list_Color.size() ,list_Color.size() - q_j_2 ,-1):
					set_color_font(list_Color[i-1] ,q_i_Color)
				break
			else:
				for i in range(list_Color.size() ,line.x - ( q_j_2 - line.z) ,-1):
					set_color_font(list_Color[i-1] ,q_i_Color)
				break
	list_Color.clear()
