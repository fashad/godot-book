#Q_3
extends Control


#Page
var The_first_distance =""
var i_pr_Page =""



#Show-text
var str_show_Page


func spawn_pieces():
#	print(i_split.size())
	var set_page = ""
	var set_line = "" 
	var character_length = 0
	var set_Write_line =[]
	for i in G_Class.i_split:
		if character_length < G_Class.i_ch &&  (character_length +i.length()) < G_Class.i_ch:
			set_Write_line.append(i)
			character_length =  character_length + i.length() + 1
		else:
#			print("ch " ,character_length)
			var space_line = (G_Class.i_ch +1) - character_length
			set_line = format_Space(set_Write_line ,space_line)
			set_Write_line.clear()
#			print("set_ lin ",set_line.length())
#			print("--------")
			set_page = set_page + set_line
			set_page = set_page + "\n"
			set_line = ""
			set_line = i #+ "|"
			set_Write_line.append(set_line)
			character_length = set_line.length() + 1
			pass
	set_line =""
#	set_Write_line.remove(0)
	
	set_line = The_first_distance
	for i in set_Write_line:
		set_line = set_line + i+ " "
	set_page = set_page + set_line 
	str_show_Page = set_page
#	print(str_show_Page)
	$Label.PersianText =str_show_Page
#	str_show_Page = pr_array_Page[Counting]



func format_Space(set_Write_line ,space_line):
	var set_line = The_first_distance
	var coun_space = 0
	for i in set_Write_line:
		if coun_space <= space_line:
			set_line = set_line +" "+ i +" " 
			coun_space += 1
		else:
			set_line = set_line + i +" " 
	return set_line

