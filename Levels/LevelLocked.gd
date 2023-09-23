extends Popup

func _on_hide_pressed() -> void:
	#This will be if th eplayer want to continue the game
	MenuClickSfxPlayer.play()
	$'.'.hide()
	print("Hides the Popup")
	
