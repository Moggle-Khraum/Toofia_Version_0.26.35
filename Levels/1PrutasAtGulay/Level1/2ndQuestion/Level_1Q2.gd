extends Panel

signal repeat

#first Question
const MISTAKE_A2_FILE_PATH = "user://playerData/level1/mistakeA2.gmd"
const MISTAKE_B2_FILE_PATH = "user://playerData/level1/mistakeB2.gmd"


func _ready() -> void:
	#This will play the Voiceover..
	voiceOver()

func _on_x_hide() -> void:
	$"%infoPotato".stream_paused = false
	print("Info Potato Plays")
	$"%repeatInfo".stream_paused = false
	print("Repeat Info Plays")

func _on_pauseButton_pressed() -> void:
	MenuClickSfxPlayer.play()
	$pausePanel.show()
	print("Shows the Pause Panel")
	$"%infoPotato".stream_paused = true
	print("Info Potato Stop")
	$"%repeatInfo".stream_paused = true
	print("Repeat Info Stop")


#=============================================================================
func _on_A_pressed():
	print('The Answer is Wrong!')
	WrongAnswer.play()
	$wrongAnswerA.show()
	$background/imageText.hide()
	$background/pauseButton.hide()
	$"%potato".hide()
	print("Pressed A, wrong Answer")
	_on_wrongAnswerA_visibility_changed()
	
	#Pauses the Audio
	$"%infoPotato".stream_paused = true
	print("Info Potato Stop")
	$"%repeatInfo".stream_paused = true
	print("Repeat Info Stop")
	
	if not hasFileA2():
		createA2Wrong()
		print("Creating FileA2")
	elif hasFileA2():
		print("FileA2 Exist")
	else:
		print("FileA2 Nonexistent")
	
func createA2Wrong():
	#Creates a script that records the mistake
	var wrongA2 = File.new()
	if wrongA2.open(MISTAKE_A2_FILE_PATH, File.WRITE) == OK:
	# Writes a number inside the Retry File, Retry 1
		wrongA2.store_string("A2 Mistake")
		wrongA2.close()
	print("Mistake A2 File Saved")
	
#Checks if the file has this.
func hasFileA2():
	print("Checking Mistake file")
	var configWrongA2 = File.new()
	print("Mistake File Exist")
	return configWrongA2.file_exists(MISTAKE_A2_FILE_PATH)
	
#=================================================================================
func _on_B_pressed():
	print('The Answer is Wrong!')
	WrongAnswer.play()
	$wrongAnswerB.show()
	$background/imageText.hide()
	$background/pauseButton.hide()
	$"%potato".hide()
	print("Pressed B, Wrong Answer")
	_on_wrongAnswerB_visibility_changed()
	
	$"%infoPotato".stream_paused = true
	print("Info Potato Stop")
	$"%repeatInfo".stream_paused = true
	print("Repeat Info Stop")
	
	if not hasFileB2():
		createB2Wrong()
		print('Creating FileB2')
	elif hasFileB2():
		print("FileB2 Exists")
	else:
		print("FileB2 Nonexistent")
		
		
func createB2Wrong():
	var wrongB2 = File.new()
	if wrongB2.open(MISTAKE_B2_FILE_PATH, File.WRITE) == OK:
	# Writes a number inside the Retry File, Retry 1
		wrongB2.store_string("B2 Mistake")
		wrongB2.close()
	print("Mistake B2 File Saved")
		
#Checks if the file has this.
func hasFileB2():
	print("Checking B2 file")
	var configWrongB2 = File.new()
	print("Mistake B2 File Exist")
	return configWrongB2.file_exists(MISTAKE_B2_FILE_PATH)

#=============================================================================
func _on_C_pressed():
	print('The Answer is Correct!')
	CorrectAnswer.play()
	$background/imageText.hide()
	$wrongAnswerC.show()
	$background/pauseButton.hide()
	$"%potato".hide()
	print('Pressed C, Wrong Answer')
	_on_correctAnswerC_visibility_changed()
	
	$"%infoPotato".stream_paused = true
	print("Info Potato Stop")
	$"%repeatInfo".stream_paused = true
	print("Repeat Info Stop")
	
	
#This is for the repeat info when pressing the button
func _on_repeat_pressed() -> void:
	$'%infoPotato'.play()
	print("Repeat Info got Pressed")
	emit_signal("repeat")
	print("Emits Signal")
	$"%infoPotato".stop()
	print("Info Potato stop")
	$'%coverButton'.show()
	$'%AnswerPanel'.hide()
	print("Cover Repeat Button")
	
func voiceOver():
	#if self.has_signal('PlayCoconut'):
	yield(get_tree().create_timer(0.5), "timeout")
	$'%infoPotato'.play()
	print("Plays Potato")
	print("Hides Repeat Button")

func _on_infoPotato_finished() -> void:
	yield(get_tree().create_timer(0.10), "timeout")
	$'%repeatInfo'.play()
	print("Play Repeat Info")
	$"%AnswerPanel".show()
	$"%blockButtons".show()
	print("Shows Answer Panel, Show Block Buttons")

func _on_wrongAnswerA_visibility_changed():
	$'%wrongAnswer'.play()
	print("Plays Wrong Answer")
	yield(get_tree().create_timer(1.10), "timeout")
	$'%DisplayStars'.show()

func _on_wrongAnswerB_visibility_changed():
	$'%wrongAnswer'.play()
	print("Plays Wrong Answer")
	yield(get_tree().create_timer(1.10), "timeout")
	$'%DisplayStars'.show()
	
func _on_correctAnswerC_visibility_changed():
	$'%correctAnswer'.play()
	print("Plays Correct")
	yield(get_tree().create_timer(1.10), "timeout")
	$'%DisplayStars'.show()
	

func _on_repeatInfo_finished():
	if not $'%repeatInfo'.playing:
		$'%coverButton'.hide()
		print("Cover Repeat buttons")
	
	if not self.has_signal("repeat"):
		$"%blockButtons".show()
		print("Show Lock")
	else:
		$"%blockButtons".hide()
		print("Hide Lock")
	




