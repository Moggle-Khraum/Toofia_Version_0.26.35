extends Control

func _ready() -> void:
	# Find the AudioStreamPlayer node and start playing the theme
	MainMenuThemePlayer.play()
	print("Plays the Main Menu Theme")

func _on_GoBackButton_pressed():
	print("Presses Go Back")
	MenuClickSfxPlayer.play()
	# Store playback position before changing scene
	MainMenuThemePlayer.stop() 
	# Stop playback before changing scene
	# Change scene
	var next_load = get_tree().change_scene("res://Scenes/MainMenu.tscn")
	print("Going to Main Menu")


###############################################
#THIS IS FOR THE TOPIC CARDS BUTTONS
	
func _on_CardMenu1_pressed():
	MenuClickSfxPlayer.play()
	print("Presses 1")
	$'%PrutasAtGulay'.show()
	print("Going to Prutas at Gulay Levels")

func _on_CardMenu2_pressed():
	MenuClickSfxPlayer.play()
	print("Presses 2")
	$'%MgaHayopSaBukid'.show()
	print("Going to Mga Hayop sa Bukid")

func _on_CardMenu3_pressed():
	MenuClickSfxPlayer.play()
	print("Presses 3")
	$'%PagguhitNgAlpabeto'.show()
	print("Popupshows AlphabetTracingInfo")

func _on_CardMenu4_pressed():
	MenuClickSfxPlayer.play()
	print("Presses 4")
	$'%ParteNgKatawanNgTao'.show()
	print("Popupshows PartsOfTheHumanBodyInfo")


