extends Control

func _ready() -> void:
	#This will play the credits theme
	CreditsThemePlayer.play()
	print("Plays Credits Theme")

func _on_ExitButton_pressed():
	#This will produce a click sound
	MenuClickSfxPlayer.play()
	print("Presses Go Back")
	#Initializes the next screen
	var _nextLoad = get_tree().change_scene("res://Scenes/MainMenu.tscn")
	print ("Closes Credits Shows")
	#This will stop the the music once it exit the scene
	CreditsThemePlayer.stop()
	print("Stops Credits Theme")
	
