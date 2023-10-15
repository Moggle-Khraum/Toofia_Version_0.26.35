extends Control

func _ready() -> void:
	# Find the AudioStreamPlayer node and start playing the theme
	MainMenuThemePlayer.play()
	print("Plays the Main Menu Theme")
	# Connect the signal to the method
	

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
	#var prutasATgulay = load('res://Levels/1PrutasAtGulay/PrutasAtGulayLevel.tscn')
	#var levels = get_tree().change_scene_to(prutasATgulay)
	$'%PrutasAtGulay'.show()
	MainMenuThemePlayer.stop()
	print("Going to Prutas at Gulay Levels")

func _on_CardMenu2_pressed():
	MenuClickSfxPlayer.play()
	print("Presses 2")
	#var farmAnimals = get_tree().change_scene("res://Levels/MgaHayopSaBukid/MgaHayopSaBukid.tscn")
	$'%MgaHayopSaBukid'.show()
	MainMenuThemePlayer.stop()
	print("Going to Mga Hayop sa Bukid")

func _on_CardMenu3_pressed():
	MenuClickSfxPlayer.play()
	print("Presses 3")
	#var traceAlphabet = get_tree().change_scene("res://Levels/PagguhitNgAlpabeto/PagguhitNgAlpabeto.tscn")
	#MainMenuThemePlayer.stream_paused = true
	#print("Popupshows AlphabetTracingInfo")

func _on_CardMenu4_pressed():
	MenuClickSfxPlayer.play()
	print("Presses 4")
	#var humanBody = get_tree().change_scene("res://Levels/ParteNgKatawanNgTao/ParteNgKatawanNgTao.tscn")
	#MainMenuThemePlayer.stream_paused = true
	#print("Popupshows PartsOfTheHumanBodyInfo")


