#Q_4_Get_help
extends Control

#Font_Color
var Font_Color =load("res://1_UI/UI_1_Page_Line_Char/UI_4_Font_Color_Style/Font_Color_Text.gd").new()
#word
var ch_Label = preload("res://1_UI/UI_1_Page_Line_Char/UI_3_Char_text/ch_3_Label/ch_3_Label.tscn")

#List_Class_Ification
var List_If = load("res://3_Data/List_Class_Ification.gd").new()


#Word_filtering---------------------------------------------
func Word_filtering(i_split):
#	var i_split ="	dfgfd"
	var filter = ""
	var Word =[]
	for i in i_split:
		Word.append(ord(i))
	if !Word.find(9) == -1 || !Word.find(61656) == -1:
		Word.remove(Word.find(9))
		Word.remove(Word.find(61656)) 
	for i in Word:
		filter = filter +char(i)
	return filter

#Word_arrayiny	
func Word_right_left(i_split):
	var arrayiny = []
	arrayiny =i_split.duplicate()
	arrayiny.invert()
	return arrayiny

#Delet_the_object
func Delet_the_object():
	for i in G_Class.ch_array_Label:
			i.queue_free()
	G_Class.ch_array_Label.clear()
	G_Class.array_line_Word.clear()
	

#Right_Left--Counting_Word---------------------------------------------------------
#Word_Right_Left 
func Word_order(i_split):
	var coun_ok = 0
	var i_array= []
	var i_array_Word = []
	for i in G_Class.array_line_Word:
		var j = 0
		while j < i.x:
			i_array.append(i_split[coun_ok])
			coun_ok +=1
			j +=1
		i_array = Word_right_left(i_array)
		i_array_Word.append_array(i_array)
		i_array.clear()
		G_Class.i_split = i_array_Word


#-----------------------------------------------------------------------------------------
#Making_an_object
func Making_an_object(Address_Object):
	var coun_ok = 1
	for i in G_Class.array_line_Word:
		new_Label(i.x ,coun_ok ,coun_ok+1 ,Address_Object)#(20 ,1 ,2) #|> (20  1 ,17)
		coun_ok +=1


##array_Word_line
func Counting_Word_line_char(i_split): 
	Delet_the_object()
	var i_ch = G_Class.i_ch #i_ch=39 |  7 = i_ch = (1) 
	var Word_char = Vector2(0 ,0)#Word_char.x = Word_ok| Word_char.y =character_length
	var erorr = 0
	for i in i_split:
		if Word_char.y < i_ch &&  (Word_char.y +i.i_length) < i_ch:
			Word_char.x += 1
			Word_char.y = Word_char.y + i.i_length
		else:
			if erorr < G_Class.page:# 17
				G_Class.array_line_Word.append(Word_char)
				Word_char.y = i.i_length
				Word_char.x = 1
				erorr += 1
			else:
				erorr += 1
				print("Class Q_4")
				print("erorr line > 1 To ", G_Class.page , "|> " ,erorr)
#				array_Word_char.clear()
	G_Class.array_line_Word.append(Word_char)



#new_Label
func new_Label(i_ch ,line_St_Writ ,line_end_Writ ,Address_Object):
#	new_chret(20 ,1 ,2) #|> (20  1 ,17)
#	var coun_name = 0 
	for i in range(line_St_Writ,line_end_Writ):# line  All( 1 , 20)
		if line_end_Writ < G_Class.page:# 20
			var j = 0
			while j < i_ch: # 7 = ch = (1) 
				var i_ch_Label = ch_Label.instance()
				get_node(Address_Object+String(i)).add_child(i_ch_Label)
				i_ch_Label.size_flags_horizontal = G_Class.size_flags_horizontal
				var dynamic_font = DynamicFont.new()
				dynamic_font.font_data =load(Font_Color.i_Style[G_Class.font_style])
				dynamic_font.size = G_Class.font_size
				dynamic_font.extra_spacing_top = G_Class.font_line_top_down
				
				i_ch_Label.set("custom_fonts/font" ,dynamic_font)
				G_Class.ch_array_Label.append(i_ch_Label)
				j +=1
		else:
			G_Class.ch_array_Label.clear()
			print("Class Q_4")
			print("Erorr add_child  > 1 To ", line_end_Writ)



#Set_the_word_on_the_page
func Set_the_word_on_the_page():
	var i = 0
	while i < G_Class.array_line_Word.size():
		if i < G_Class.page:
			var j =  (G_Class.i_ch - G_Class.array_line_Word[i].y)
			get_node("A_1/A1/A1/Re"+String(i+1)).set("custom_constants/separation", j)
		else:
			G_Class.ch_array_Label.clear()
			print("Class Q_4")
			print("Erorr Set_the_word_on_the_page > 1 To  ",G_Class.page ," > " ,i)
		i +=1

#-------------------------------------------------------------------------
#Color_the_word(G_Class.Color_word)
func Color_the_word(varbl):
	for i in G_Class.ch_array_Label.size():
		Font_Color.Find_the_desired_color(i ,G_Class.array_line_Word ,varbl ,"Yellowing")#رنگ گردن کلمه
	Font_Color.Pour_the_paint()#رنگ گردن کلمه

#var Sports = []
func Edit_color_list_text():
	var Backgrand =""
	match G_Class.Backgrand:
		"Yellowing":#White------
			Backgrand ="Black"
		"Black":#Black------
			Backgrand ="Yellowing"
		"White":#Black------
			Backgrand ="Yellowing"
		"Black_Yellowing":#Black------
			Backgrand ="White"
		_:#Defalt--------
			Backgrand ="Yellowing"
	var  h = 0
	while h < G_Class.i_split.size():
		for i in List_If.Part_One:
			if i == G_Class.i_split[h].i_id:
				G_Class.i_split[h].i_Color = Backgrand
		h +=1
	
