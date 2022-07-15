#S_1
extends Control

func _ready():
	match G_Class.Backgrand:
		"White":#White------
			$s1/A2/UI_11_Page_Border/A1/A1/A1/B1.color = Color(1 ,1 ,1 ,1)
		"Black":#Black------
			$s1/A2/UI_11_Page_Border/A1/A1/A1/B1.color = Color(0 ,0 ,0 ,1)
		"Yellowing":#Yellowing-----
			$s1/A2/UI_11_Page_Border/A1/A1/A1/B1.color = Color(1 ,1 ,1 ,1)
		_:#Defalt--------
			$s1/A2/UI_11_Page_Border/A1/A1/A1/B1.color = Color(0.29 ,0.29 ,0.29 ,1)



func spawn_pieces():
	if $s1/A2/A1/Q_3.visible:
		$s1/A2/A1/Q_3.spawn_pieces()
	elif $s1/A2/A1/Q_4.visible:
#		$s1/A2/A1/Q_4.spawn_pieces(G_Class.i_split)
		$s1/A2/A1/Q_4.spawn_pieces()
	elif $s1/A2/A1/Q_5.visible:
		$s1/A2/A1/Q_5.spawn_pieces()
		
		



