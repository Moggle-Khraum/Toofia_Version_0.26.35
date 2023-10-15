extends BaseScroll
#The above is referencing the Template base called BaseScroll

var backtoTopic = load('res://Scenes/MenuChoices.tscn')

#THIS IS FOR SIGNAL that was used by Buttons
signal pressed

#func _ready() -> void:
#	$'%fruitTheme'.play()

#This is for the Left Button
func _on_LeftButton_pressed() -> void:
	ScrollPop.play()
	# Calculate the target horizontal scroll position
	scrollerContainer.scroll_horizontal = lerp(scrollerContainer.scroll_horizontal, scrollerContainer.scroll_horizontal - scrollStep, scrollWeight)
	scrollerContainer.scroll_horizontal -= scrollStep
	print("Pressed Left Button '<='")
	
#This is for the Right Button
func _on_RightButton_pressed() -> void:
	ScrollPop.play()
	scrollerContainer.scroll_horizontal = lerp(scrollerContainer.scroll_horizontal, scrollerContainer.scroll_horizontal + scrollStep, scrollWeight)
	scrollerContainer.scroll_horizontal += scrollStep
	print("Pressed Rigght Button '=>'")

func _on_GoBackButton_pressed() -> void:
	print("Presses Go Back")
	MenuClickSfxPlayer.play()
	#handles the Go back button
	var levelSelect = get_tree().change_scene_to(backtoTopic)
	print("Going to Topic Selector")
	$'%fruitTheme'.stop()


func _on_PrutasAtGulay_visibility_changed() -> void:
	$'%fruitTheme'.play()
	print("Theme Fruit Plays")
	

################################################################################################
# THIS IS FOR THE LEVELS, THE BUTTONS OF LEVELS

#UPPER ROW BUTTONS
# THIS IS LEVEL 1
func _on_1Button_pressed() -> void:
	LevelsButtons.play()	
	print("Presses Level 1")
	var level1 = get_tree().change_scene("res://Levels/1PrutasAtGulay/Level1/1stQuestion/Level_1Q1.tscn")
	emit_signal('pressed')
	print ("You are now at Level 1")
	
	var playerdata = PlayerData.new()
	playerdata.createPlayerData1()
	
	print ("You are now at Level 1")
	MainMenuThemePlayer.stop()
	$'%fruitTheme'.stop()

# THIS IS LEVEL 2
func _on_2Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 2")
	var level1 = get_tree().change_scene("res://Levels/1PrutasAtGulay/Level1/2ndQuestion/Level_1Q2.tscn")
	emit_signal('pressed')
	print ("You are now at Level 2")
	
	var playerdata2 = PlayerData2.new()
	playerdata2.createPlayerData2()
	
	print ("You are now at Level 2")
	
# THIS IS LEVEL 3
func _on_3Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 3")
	emit_signal('pressed')
	print ("You are now at Level 3")
	createPlayerData3()
	print ("You are now at Level 3")

# THIS IS LEVEL 4
func _on_4Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 4")
	emit_signal('pressed')
	print ("You are now at Level 4")
	createPlayerData4()
	print ("You are now at Level 4")

# THIS IS LEVEL 5
func _on_9Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 5")
	emit_signal('pressed')
	print ("You are now at Level 5")
	createPlayerData9()
	print ("You are now at Level 5")

# THIS IS LEVEL 6
func _on_10Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 6")
	emit_signal('pressed')
	print ("You are now at Level 6")
	createPlayerData10()
	print ("You are now at Level 6")

# THIS IS LEVEL 7
func _on_11Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 7")
	emit_signal('pressed')
	print ("You are now at Level 7")
	createPlayerData11()
	print ("You are now at Level 7")

# THIS IS LEVEL 8
func _on_12Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 8")
	emit_signal('pressed')
	print ("You are now at Level 8")
	createPlayerData12()
	print ("You are now at Level 8")

### LOW ROW BUTTONS
# THIS IS LEVEL 9
func _on_5Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 9")
	emit_signal('pressed')
	print ("You are now at Level 9")
	createPlayerData5()
	print ("You are now at Level 9")

# THIS IS LEVEL 10
func _on_6Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 10")
	emit_signal('pressed')
	print ("You are now at Level 10")
	createPlayerData6()
	print ("Level 10 Data Folder Created")

# THIS IS LEVEL 11
func _on_7Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 11")
	emit_signal('pressed')
	print ("You are now at Level 11")
	createPlayerData7()
	print ("Level 11 Data Folder Created")

# THIS IS LEVEL 12
func _on_8Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 12")
	emit_signal('pressed')
	print ("You are now at Level 12")
	createPlayerData8()
	print ("Level 12 Data Folder Created")

# THIS IS LEVEL 13
func _on_13Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 13")
	emit_signal('pressed')
	print ("You are now at Level 13")
	createPlayerData13()
	print ("Level 13 Data Folder Created")

# THIS IS LEVEL 14
func _on_14Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 14")
	emit_signal('pressed')
	print ("You are now at Level 14")
	createPlayerData14()
	print ("Level 14 Data Folder Created")

# THIS IS LEVEL 15
func _on_15Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 15")
	emit_signal('pressed')
	print ("You are now at Level 15")
	createPlayerData15()
	print ("Level 15 Data Folder Created")
	


#THE BUTTONS BELOW IS FOR THE LEVEL ERROR
#THIS IS FOR THE ERROR SOUND EFFECTS
func _on_lockInfo_pressed() -> void:
	LevelError.play()
	print("Level Locked")
	$'%bgPanel'.show()
	print("Open Level Locked")
	pass # Replace with function body.

func _on_hide_pressed() -> void:
	MenuClickSfxPlayer.play()
	$'%bgPanel'.hide()
	print("Hides LevelLock")


#===============================================
# THIS WILL CREATE THE FOLDER THAT STORES THIS LEVEL'S SCRIPTS
class PlayerData:
	func createPlayerData1():
		print("Creating..")
		# Ensure the configuration folder exists
		var data_dir = "user://playerData/level1/1stQuestion"
		var dir = Directory.new()
		if not dir.dir_exists(data_dir):
			dir.make_dir_recursive(data_dir)
			print("Level1 Data Done!")
		print("Folder Created..")

class PlayerData2 extends PlayerData:
	func createPlayerData2():
		print("Creating..")
		# Ensure the configuration folder exists
		var data_dir = "user://playerData/level2/2ndQuestion"
		var dir = Directory.new()
		if not dir.dir_exists(data_dir):
			dir.make_dir_recursive(data_dir)
			print("Level2 Data Done!")
		print("Folder Created..")




	
func createPlayerData3():
	print("Creating..")
	# Ensure the configuration folder exists
	var data_dir = "user://playerData/level3/1stQuestion"
	var dir = Directory.new()
	if not dir.dir_exists(data_dir):
		dir.make_dir_recursive(data_dir)
		print("Level3 Data Done!")
	print("Folder Created..")

func createPlayerData4():
	print("Creating..")
	# Ensure the configuration folder exists
	var data_dir = "user://playerData/level4/1stQuestion"
	var dir = Directory.new()
	if not dir.dir_exists(data_dir):
		dir.make_dir_recursive(data_dir)
		print("Level4 Data Done!")
	print("Folder Created..")
	
func createPlayerData5():
	print("Creating..")
	# Ensure the configuration folder exists
	var data_dir = "user://playerData/level5/1stQuestion"
	var dir = Directory.new()
	if not dir.dir_exists(data_dir):
		dir.make_dir_recursive(data_dir)
		print("Level5 Data Done!")
	print("Folder Created..")
	
func createPlayerData6():
	print("Creating..")
	# Ensure the configuration folder exists
	var data_dir = "user://playerData/level6/1stQuestion"
	var dir = Directory.new()
	if not dir.dir_exists(data_dir):
		dir.make_dir_recursive(data_dir)
		print("Level6 Data Done!")
	print("Folder Created..")
	
func createPlayerData7():
	print("Creating..")
	# Ensure the configuration folder exists
	var data_dir = "user://playerData/level7/1stQuestion"
	var dir = Directory.new()
	if not dir.dir_exists(data_dir):
		dir.make_dir_recursive(data_dir)
		print("Level7 Data Done!")
	print("Folder Created..")
	
func createPlayerData8():
	print("Creating..")
	# Ensure the configuration folder exists
	var data_dir = "user://playerData/level8/1stQuestion"
	var dir = Directory.new()
	if not dir.dir_exists(data_dir):
		dir.make_dir_recursive(data_dir)
		print("Level8 Data Done!")
	print("Folder Created..")
	
func createPlayerData9():
	print("Creating..")
	# Ensure the configuration folder exists
	var data_dir = "user://playerData/level9/1stQuestion"
	var dir = Directory.new()
	if not dir.dir_exists(data_dir):
		dir.make_dir_recursive(data_dir)
		print("Level9 Data Done!")
	print("Folder Created..")
	
func createPlayerData10():
	print("Creating..")
	# Ensure the configuration folder exists
	var data_dir = "user://playerData/level10/1stQuestion"
	var dir = Directory.new()
	if not dir.dir_exists(data_dir):
		dir.make_dir_recursive(data_dir)
		print("Level10 Data Done!")
	print("Folder Created..")
	
func createPlayerData11():
	print("Creating..")
	# Ensure the configuration folder exists
	var data_dir = "user://playerData/level11/1stQuestion"
	var dir = Directory.new()
	if not dir.dir_exists(data_dir):
		dir.make_dir_recursive(data_dir)
		print("Level11 Data Done!")
	print("Folder Created..")
	
func createPlayerData12():
	print("Creating..")
	# Ensure the configuration folder exists
	var data_dir = "user://playerData/level12/1stQuestion"
	var dir = Directory.new()
	if not dir.dir_exists(data_dir):
		dir.make_dir_recursive(data_dir)
		print("Level12 Data Done!")
	print("Folder Created..")
	
func createPlayerData13():
	print("Creating..")
	# Ensure the configuration folder exists
	var data_dir = "user://playerData/level13/1stQuestion"
	var dir = Directory.new()
	if not dir.dir_exists(data_dir):
		dir.make_dir_recursive(data_dir)
		print("Level13 Data Done!")
	print("Folder Created..")
	
func createPlayerData14():
	print("Creating..")
	# Ensure the configuration folder exists
	var data_dir = "user://playerData/level14/1stQuestion"
	var dir = Directory.new()
	if not dir.dir_exists(data_dir):
		dir.make_dir_recursive(data_dir)
		print("Level14 Data Done!")
	print("Folder Created..")
	
func createPlayerData15():
	print("Creating..")
	# Ensure the configuration folder exists
	var data_dir = "user://playerData/level15/1stQuestion"
	var dir = Directory.new()
	if not dir.dir_exists(data_dir):
		dir.make_dir_recursive(data_dir)
		print("Level15 Data Done!")
	print("Folder Created..")

