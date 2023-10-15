extends Node


func _on_ExitButton_pressed():
	print("Presses 'X'")
	var _nextLoad = get_tree().change_scene('res://Scenes/MainMenu.tscn')
	print ("Closes Popup")
	MenuClickSfxPlayer.play()
	print("Going to Credits")


