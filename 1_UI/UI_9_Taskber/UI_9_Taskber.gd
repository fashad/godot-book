#UI_9 Taskber
extends Node2D


func _process(_delta):
	$A1/HSlider.value = G_Class.Counting



#UI_1_Show_Page------------------------------------
func _on_UI_1_Show_Page_i_HSlider(pr_array_Page):
#	print(pr_array_Page)
	if G_Class.Counting < pr_array_Page:
		$A1/Label_Load.text = str(pr_array_Page ," / ",G_Class.Counting+1)
	$A1/HSlider.max_value = pr_array_Page
	$A1/HSlider.value = G_Class.Counting
#	get_parent().get_node()
	
