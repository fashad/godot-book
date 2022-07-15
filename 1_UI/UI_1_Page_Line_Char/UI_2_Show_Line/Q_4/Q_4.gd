#Q_4
extends  "res://1_UI/UI_1_Page_Line_Char/UI_2_Show_Line/Q_Get_help/Q_Get_help.gd"

#Ification
var Ification =load("res://3_Data/List_Class_Ification.gd").new()

func _ready():
	G_Class.ch_array_Label.clear()


#spawn_pieces-----------------------------------
func spawn_pieces():
	Counting_Word_line_char(G_Class.i_split)
	Making_an_object("A_1/A1/A1/Re")
	Word_order(G_Class.i_split)
	show_page_text()
	Edit_color_list_text()
	Set_the_word_on_the_page()
	Add_constant_A1()
	print(G_Class.array_line_Word)
	




#show_page-Making_an_object----------------------------------
#show_page
func show_page_text():
	for i in G_Class.ch_array_Label.size():
		G_Class.ch_array_Label[i].PersianText = Word_filtering(G_Class.i_split[i].i_name)
		Font_Color.set_color_font(G_Class.ch_array_Label[i] ,G_Class.i_split[i].i_Color)


func set_Color_Style_View():
	Edit_color_list_text()
	show_page_text()
	for i in G_Class.ch_array_Label.size():
		G_Class.ch_array_Label[i].size_flags_horizontal = G_Class.size_flags_horizontal
		Font_Color.Font_Style_line(i, G_Class.font_style ,G_Class.font_size)


func Add_constant_A1():
	var A1 = $A_1/A1/A1
#	A1.visible
	var View_rect = get_viewport_rect().size
	print(A1.get_size().x ," <> " , View_rect.x)
	for i in range(1 ,G_Class.page):
#		print(get_node("A_1/A1/A1/Re1").name)
		var objack_1 = get_node("A_1/A1/A1/Re"+String(i))
		var h = 0
		while A1.get_size().x < View_rect.x:
#		while h < 1:
			print(A1.get_size().x ," <> " , View_rect.x)
			print("hi " ,h)
			print("---------")
			A1.set_size(View_rect)
			print(objack_1)
			objack_1.add_constant_override("separation" ,-h)
			h +=1
			
			


