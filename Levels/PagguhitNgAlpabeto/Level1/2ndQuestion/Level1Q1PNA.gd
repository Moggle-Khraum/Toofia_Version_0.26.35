extends Control

func _on_pauseButton_pressed() -> void:
	MenuClickSfxPlayer.play()
	$'%pausePanel'.show()
	print("Shows the Pause Panel")
	
func _on_A_pressed() -> void:
	$'%AcceptDialog'.show()
	WrongAnswer.play()
	print("You are Wrong!")
	print("Selected A! Wrong!")

func _on_B_pressed() -> void:
	$'%AcceptDialog2'.show()
	print("You are correct!")
	CorrectAnswer.play()
	print("Selected B! Correct")


func _on_C_pressed() -> void:
	$'%AcceptDialog3'.show()
	print("You are Wrong!")
	WrongAnswer.play()
	print("Selected C! Correct")

#########################################################
#Ths is for hiding the popup
func _on_x_pressed() -> void:
	$'%pausePanel'.hide()
	print("Hides the Pause Panel")
