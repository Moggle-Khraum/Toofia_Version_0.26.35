extends BaseScroll
#The above is referencing the Template base called BaseScroll

#THIS IS FOR SIGNAL that was used by Buttons
signal pressed

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
	$'.'.hide()
	print("Going to Topic Selector")
	

################################################################################################
#
#UPPER ROW BUTTONS
# THIS IS LEVEL 1
func _on_1Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 1")
	$'Panel/3QuestDummy'.show()
	emit_signal('pressed')
	print ("You are now at Level 1")

# THIS IS LEVEL 2
func _on_2Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 2")
	$'Panel/3QuestDummy'.show()
	emit_signal('pressed')
	print ("You are now at Level 2")
	
# THIS IS LEVEL 3
func _on_3Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 3")
	$'Panel/3QuestDummy'.show()
	emit_signal('pressed')
	print ("You are now at Level 3")

# THIS IS LEVEL 4
func _on_4Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 4")
	$'Panel/3QuestDummy'.show()
	emit_signal('pressed')
	print ("You are now at Level 4")

# THIS IS LEVEL 5
func _on_9Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 5")
	$'Panel/3QuestDummy'.show()
	emit_signal('pressed')
	print ("You are now at Level 5")

# THIS IS LEVEL 6
func _on_10Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 6")
	$'Panel/3QuestDummy'.show()
	emit_signal('pressed')
	print ("You are now at Level 6")

# THIS IS LEVEL 7
func _on_11Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 7")
	$'Panel/3QuestDummy'.show()
	emit_signal('pressed')
	print ("You are now at Level 7")

# THIS IS LEVEL 8
func _on_12Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 8")
	$'Panel/3QuestDummy'.show()
	emit_signal('pressed')
	print ("You are now at Level 8")

### LOW ROW BUTTONS
# THIS IS LEVEL 9
func _on_5Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 9")
	$'Panel/3QuestDummy'.show()
	emit_signal('pressed')
	print ("You are now at Level 9")

# THIS IS LEVEL 10
func _on_6Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 10")
	$'Panel/3QuestDummy'.show()
	emit_signal('pressed')
	print ("You are now at Level 10")

# THIS IS LEVEL 11
func _on_7Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 11")
	$'Panel/3QuestDummy'.show()
	emit_signal('pressed')
	print ("You are now at Level 11")

# THIS IS LEVEL 12
func _on_8Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 12")
	$'Panel/3QuestDummy'.show()
	emit_signal('pressed')
	print ("You are now at Level 12")

# THIS IS LEVEL 13
func _on_13Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 13")
	$'Panel/3QuestDummy'.show()
	emit_signal('pressed')
	print ("You are now at Level 13")

# THIS IS LEVEL 14
func _on_14Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 14")
	$'Panel/3QuestDummy'.show()
	emit_signal('pressed')
	print ("You are now at Level 14")

# THIS IS LEVEL 15
func _on_15Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 15")
	$'Panel/3QuestDummy'.show()
	emit_signal('pressed')
	print ("You are now at Level 15")
	
# THIS IS LEVEL 16
func _on_16Button_pressed() -> void:
	LevelsButtons.play()
	print("Presses Level 16")
	$'Panel/3QuestDummy'.show()
	emit_signal('pressed')
	print ("You are now at Level 16")


