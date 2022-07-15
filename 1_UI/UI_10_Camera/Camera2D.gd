#Camera2D
extends Camera2D


func _ready():
	offset = Vector2(185 ,250)
	zoom = G_Class.camera_zoomed
	
func _on_UI_6_Settings_zoom_Camer():
	 _ready()
