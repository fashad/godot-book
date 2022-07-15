# G_Class
extends Node

#Arrays
var i_pr_Page = []#Ail_Word
var ch_array_Label = []#Object_Label
var pr_array_Page = []#array_Page_All_Word
var array_line_Word=[]#array_Page_one_Word
var i_split = []#array_Page_one


# Update process Show text
var Update_UI_1_Show_Page = false
var Update_UI_6_Settings = false

#Camera
var camera_zoomed = Vector2(1 ,1)



#font
var font_size = 16
var font_style = 0
var font_Color = 0

# Word Page Line 
var Counting = 0 # pr_array_Page[Counting]
var width = 1000
var Word_count_and_break = 100  #90
var i_ch = 41 #i_ch=35 |  7 = i_ch = (1) #41
var page = 40 #18

# SIZE_EXPAND = 2  SIZE_FILL = 1  SIZE_EXPAND_FILL = 3
var size_flags_horizontal = 2 #SIZE_EXPAND
var font_line_top_down = 0

#Color_the_word
var Color_word = 15

#Backgrand
var Backgrand  ="Defalt"

#Address Object
var Address_Object =""


