extends Node

var i_id = -1
var i_name =""
var i_Color =""
var i_length = -1


func set_list(id :int ,name :String ,i_Col :String) -> void:
	self.i_id = id
#	self.i_name = name+str(id)
	self.i_name = name
	self.i_Color = i_Col
	self.i_length = i_name.length()
func show_text_var():
	print(i_id , " ",i_name ," " ,i_Color," " ,i_length)
