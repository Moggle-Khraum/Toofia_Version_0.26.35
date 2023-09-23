extends Control


func _on_ExitButton_pressed() -> void:
	print("Presses Go back")
	$'.'.hide()
	print ("Closes Levels")
	showMainLevel()
	print("Going to Levels Choices")

func showMainLevel():
	$'../..'.show()
	print("Reveal the Level Selection popup")
